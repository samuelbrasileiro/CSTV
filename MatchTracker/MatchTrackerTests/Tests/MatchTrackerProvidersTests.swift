//
//  MatchTrackerProvidersTests.swift
//  MatchTrackerTests
//
//

import XCTest
@testable import MatchTracker

class MatchTrackerProvidersTests: XCTestCase {
    
    // MARK: - Test PlayersProvider
    
    func testPlayersProvider() async {
        let serviceMock = MatchTrackerServiceMock()
        let playersProvider = PlayersProvider(service: serviceMock)
        do {
            let playersResponse = try await playersProvider.execute(teamId: 1)
            XCTAssertNotNil(playersResponse)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // MARK: - Test RunningMatchesProvider
    
    func testRunningMatchesProvider() async {
        let serviceMock = MatchTrackerServiceMock()
        let runningMatchesProvider = RunningMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await runningMatchesProvider.execute()
            XCTAssertNotNil(matchesResponse)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // MARK: - Test UpcomingMatchesProvider
    
    func testUpcomingMatchesProvider() async {
        let serviceMock = MatchTrackerServiceMock()
        let upcomingMatchesProvider = UpcomingMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await upcomingMatchesProvider.execute(page: 1)
            XCTAssertNotNil(matchesResponse)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // MARK: - Test PlayersProvider Failure
    
    func testPlayersProviderFailure() async {
        let serviceMock = MatchTrackerServiceErrorMock()
        let playersProvider = PlayersProvider(service: serviceMock)
        do {
            _ = try await playersProvider.execute(teamId: 1)
            XCTFail("PlayersProvider should have thrown an error.")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    // MARK: - Test RunningMatchesProvider Failure
    
    func testRunningMatchesProviderFailure() async {
        let serviceMock = MatchTrackerServiceErrorMock()
        let runningMatchesProvider = RunningMatchesProvider(service: serviceMock)
        do {
            _ = try await runningMatchesProvider.execute()
            XCTFail("RunningMatchesProvider should have thrown an error.")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    // MARK: - Test UpcomingMatchesProvider Failure
    
    func testUpcomingMatchesProviderFailure() async {
        let serviceMock = MatchTrackerServiceErrorMock()
        let upcomingMatchesProvider = UpcomingMatchesProvider(service: serviceMock)
        do {
            _ = try await upcomingMatchesProvider.execute(page: 1)
            XCTFail("UpcomingMatchesProvider should have thrown an error.")
        } catch {
            // UpcomingMatchesProvider should throw an error
            XCTAssertNotNil(error)
        }
    }
    
    // MARK: - Test PlayersProvider with Empty Data
    
    func testPlayersProviderWithEmptyData() async {
        let serviceMock = MatchTrackerServiceEmptyDataMock()
        let playersProvider = PlayersProvider(service: serviceMock)
        do {
            let playersResponse = try await playersProvider.execute(teamId: 1)
            XCTAssertTrue(playersResponse.isEmpty)
        } catch {
            XCTFail("PlayersProvider should not throw an error.")
        }
    }
    
    // MARK: - Test RunningMatchesProvider with Empty Data
    
    func testRunningMatchesProviderWithEmptyData() async {
        let serviceMock = MatchTrackerServiceEmptyDataMock()
        let runningMatchesProvider = RunningMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await runningMatchesProvider.execute()
            XCTAssertTrue(matchesResponse.isEmpty)
        } catch {
            XCTFail("RunningMatchesProvider should not throw an error.")
        }
    }
    
    // MARK: - Test UpcomingMatchesProvider with Empty Data
    
    func testUpcomingMatchesProviderWithEmptyData() async {
        let serviceMock = MatchTrackerServiceEmptyDataMock()
        let upcomingMatchesProvider = UpcomingMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await upcomingMatchesProvider.execute(page: 1)
            XCTAssertTrue(matchesResponse.isEmpty)
        } catch {
            XCTFail("UpcomingMatchesProvider should not throw an error.")
        }
    }
    
    // MARK: - Test PlayersProvider with Multiple Players
    
    func testPlayersProviderWithMultiplePlayers() async {
        let serviceMock = MatchTrackerServiceMultipleItemsMock()
        let playersProvider = PlayersProvider(service: serviceMock)
        do {
            let playersResponse = try await playersProvider.execute(teamId: 1)
            XCTAssertEqual(playersResponse.count, 2)
        } catch {
            XCTFail("PlayersProvider should not throw an error.")
        }
    }
    
    // MARK: - Test RunningMatchesProvider with Multiple Matches
    
    func testRunningMatchesProviderWithMultipleMatches() async {
        let serviceMock = MatchTrackerServiceMultipleItemsMock()
        let runningMatchesProvider = RunningMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await runningMatchesProvider.execute()
            XCTAssertEqual(matchesResponse.count, 2)
        } catch {
            XCTFail("RunningMatchesProvider should not throw an error.")
        }
    }
    
    // MARK: - Test UpcomingMatchesProvider with Multiple Matches
    
    func testUpcomingMatchesProviderWithMultipleMatches() async {
        let serviceMock = MatchTrackerServiceMultipleItemsMock()
        let upcomingMatchesProvider = UpcomingMatchesProvider(service: serviceMock)
        do {
            let matchesResponse = try await upcomingMatchesProvider.execute(page: 1)
            XCTAssertEqual(matchesResponse.count, 2)
        } catch {
            XCTFail("UpcomingMatchesProvider should not throw an error.")
        }
    }
    
    // MARK: - Test PlayersProvider Cache
    
    func testPlayersProviderCache() async {
        let serviceMock = MatchTrackerServiceCachingMock()
        let playersProvider = PlayersProvider(service: serviceMock)
        do {
            let firstResponse = try await playersProvider.execute(teamId: 1)
            XCTAssertNotNil(firstResponse)
            let secondResponse = try await playersProvider.execute(teamId: 1)
            XCTAssertNotNil(secondResponse)
            XCTAssertEqual(serviceMock.callCount, 1)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // MARK: - Test RunningMatchesProvider Cache
    
    func testRunningMatchesProviderCache() async {
        let serviceMock = MatchTrackerServiceCachingMock()
        let runningMatchesProvider = RunningMatchesProvider(service: serviceMock)
        do {
            let firstResponse = try await runningMatchesProvider.execute()
            XCTAssertNotNil(firstResponse)
            let secondResponse = try await runningMatchesProvider.execute()
            XCTAssertNotNil(secondResponse)
            XCTAssertEqual(serviceMock.callCount, 1)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // MARK: - Test UpcomingMatchesProvider Cache
    
    func testUpcomingMatchesProviderCache() async {
        let serviceMock = MatchTrackerServiceCachingMock()
        let upcomingMatchesProvider = UpcomingMatchesProvider(service: serviceMock)
        do {
            let firstResponse = try await upcomingMatchesProvider.execute(page: 1)
            XCTAssertNotNil(firstResponse)
            let secondResponse = try await upcomingMatchesProvider.execute(page: 1)
            XCTAssertNotNil(secondResponse)
            XCTAssertEqual(serviceMock.callCount, 1)
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
}
