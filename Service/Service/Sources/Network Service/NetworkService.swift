//
//  NetworkService.swift
//  Service
//
//

import Combine
import Foundation

class NetworkService: NetworkServiceProtocol {
    private var subscriptions: Set<AnyCancellable> = []
    
    private let session: ServiceSessionProtocol
    
    init(session: ServiceSessionProtocol) {
        self.session = session
    }
    
    func fetch<T: Decodable>(_ type: T.Type,
                             from request: ServiceRequest,
                             completion: @escaping (Result<T, ServiceError>) -> Void) {
        let publisher = getFetchPublisher(from: request, decoder: { data in
            do {
                let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                return try decoder.decode(T.self, from: data)
            } catch {
                print(error)
                return nil
            }
        })
        execute(awaiting: publisher, completion: completion)
    }
    
    private func getFetchPublisher<T>(from request: ServiceRequest,
                                      decoder: @escaping (Data) throws -> T?) -> AnyPublisher<T, ServiceError> {
        guard var url = URL(string: session.buildFinalPath(from: request)) else {
            return Fail(error: ServiceError.invalidURL(url: request.path))
                .eraseToAnyPublisher()
        }
        if let queryItems = request.queryItems, #available(iOS 16.0, *) {
            url.append(queryItems: queryItems)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        if let timeout = request.timeout {
            urlRequest.timeoutInterval = timeout
        }
        if let body = request.body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        for header in request.headers ?? [:] {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        return makeFetchPublisher(from: urlRequest, decoder: decoder)
    }
    
    private func makeFetchPublisher<T>(from request: URLRequest,
                                       decoder: @escaping (Data) throws -> T?) -> AnyPublisher<T, ServiceError> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { response -> Data in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == 200
                else {
                    throw ServiceError.invalidStatusCode
                }
                return response.data
            }
            .tryMap { [weak self] data -> T in
                guard let value = try decoder(data) else {
                    if let error = try self?.decodeError(from: data) {
                        throw error.serviceError
                    }
                    throw ServiceError.dataNotDecoded
                }
                return value
            }
            .mapError { ServiceError.map($0) }
            .eraseToAnyPublisher()
    }
    
    private func execute<T>(awaiting publisher: AnyPublisher<T, ServiceError>,
                            completion: @escaping (Result<T, ServiceError>) -> Void) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { receiveCompletion in
                switch receiveCompletion {
                case .finished: break
                case .failure(let error): completion(.failure(error))
                }
            }, receiveValue: { value in
                completion(.success(value))
            })
            .store(in: &subscriptions)
    }
    
    private func decodeError(from data: Data) throws -> ErrorCodable {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ErrorCodable.self, from: data)
        } catch {
            throw error
        }
    }
}
