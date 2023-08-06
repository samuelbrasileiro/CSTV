//
//  MatchTrackerViewModelsTests.swift
//  MatchTrackerTests
//
//

import XCTest
import Combine
@testable import MatchTracker

class MatchDetailsViewModelTests: XCTestCase {
    
    var viewModel: MatchDetailsViewModel!
    var mockPlayersProvider: MockPlayersProvider!
    var testMatch: Match!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        testMatch = Match(id: 1, name: "Test Match")
        mockPlayersProvider = MockPlayersProvider()
        viewModel = MatchDetailsViewModel(match: testMatch, playersProvider: mockPlayersProvider)
    }
    
    func testRetrievePlayersSuccess() async throws {
        let player1 = Player(currentTeam: .init(id: 1), id: 1, name: "Test Player 1")
        let player2 = Player(currentTeam: .init(id: 2), id: 2, name: "Test Player 2")
        viewModel.match = .init(opponents: [.init(opponent: .init(id: 1)), .init(opponent: .init(id: 2))])
        var state: MatchDetailsViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockPlayersProvider.players = [player1, player2]
        
        await viewModel.retrievePlayers()
        
        print(viewModel.firstTeamPlayers)
        XCTAssertEqual(viewModel.firstTeamPlayers, [player1])
        XCTAssertEqual(viewModel.secondTeamPlayers, [player2])
        XCTAssertEqual(state, .success)
    }
    
    func testRetrievePlayersError() async throws {
        viewModel.match = .init(opponents: [.init(opponent: .init(id: 1)), .init(opponent: .init(id: 2))])
        let expectedError = NSError(domain: "", code: -1, userInfo: nil)
        var state: MatchDetailsViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockPlayersProvider.error = expectedError
        
        await viewModel.retrievePlayers()
        
        guard case let .error(error) = state else {
            XCTFail("Expected error state")
            return
        }

        XCTAssertEqual(error as NSError, expectedError)
    }
    
    class MockPlayersProvider: PlayersProviderProtocol {
        var players: [Player] = []
        var error: Error?
        
        func execute(teamId: Int) async throws -> [Player] {
            if let error = error {
                throw error
            }
            return players.filter { $0.currentTeam?.id == teamId }
        }
    }
}

class MatchesViewModelTests: XCTestCase {
    
    var viewModel: MatchesViewModel!
    var mockUpcomingMatchesProvider: MockUpcomingMatchesProvider!
    var mockRunningMatchesProvider: MockRunningMatchesProvider!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockUpcomingMatchesProvider = MockUpcomingMatchesProvider()
        mockRunningMatchesProvider = MockRunningMatchesProvider()
        viewModel = MatchesViewModel(upcomingMatchesProvider: mockUpcomingMatchesProvider,
                                     runningMatchesProvider: mockRunningMatchesProvider)
    }
    
    func testRetrieveMatchesSuccess() async throws {
        let match1 = Match(id: 1, name: "Test Match 1")
        let match2 = Match(id: 2, name: "Test Match 2")
        let match3 = Match(id: 3, name: "Test Match 1")
        let match4 = Match(id: 4, name: "Test Match 2")
        
        var state: MatchesViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockRunningMatchesProvider.matches = [match1, match2]
        mockUpcomingMatchesProvider.matches = [match3, match4]
        
        await viewModel.retrieveMatches()
        
        print("items")
        XCTAssertEqual(viewModel.matches, [match1, match2, match3, match4])
        XCTAssertEqual(state, .success)
    }
    
    func testRetrieveRunningMatchesError() async throws {
        let expectedError = NSError(domain: "", code: -1, userInfo: nil)
        var state: MatchesViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockRunningMatchesProvider.error = expectedError
        
        await viewModel.retrieveMatches()
        
        guard case let .error(error) = state else {
            XCTFail("Expected error state")
            return
        }

        XCTAssertEqual(error as NSError, expectedError)
    }
    
    func testRetrieveUpcomingMatchesError() async throws {
        let expectedError = NSError(domain: "", code: -1, userInfo: nil)
        var state: MatchesViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockUpcomingMatchesProvider.error = expectedError
        
        await viewModel.retrieveMatches()
        
        guard case let .error(error) = state else {
            XCTFail("Expected error state")
            return
        }

        XCTAssertEqual(error as NSError, expectedError)
    }
    
    func testPaginationSuccess() async throws {
        let match1 = Match(id: 1, name: "Test Match 1")
        let match2 = Match(id: 2, name: "Test Match 2")
        let match3 = Match(id: 3, name: "Test Match 1")
        let match4 = Match(id: 4, name: "Test Match 2")
        let match5 = Match(id: 5, name: "Test Match 1")
        let match6 = Match(id: 6, name: "Test Match 2")
        var state: MatchesViewState?

        viewModel.changeViewState
            .sink { newState in
                state = newState
            }
            .store(in: &cancellables)
        
        mockRunningMatchesProvider.matches = [match1, match2]
        mockUpcomingMatchesProvider.matches = [match3, match4]
        
        await viewModel.retrieveMatches()

        mockUpcomingMatchesProvider.matches = [match5, match6]

        
        await viewModel.retrievePaginationMatches()

        XCTAssertEqual(viewModel.matches, [match1, match2, match3, match4, match5, match6])
        XCTAssertEqual(state, .success)
    }
    
    class MockUpcomingMatchesProvider: UpcomingMatchesProviderProtocol {
        var matches: [Match] = []
        var error: Error?
        
        func execute(page: Int) async throws -> [Match] {
            if let error = error {
                throw error
            }
            return matches
        }
    }
    
    class MockRunningMatchesProvider: RunningMatchesProviderProtocol {
        var matches: [Match] = []
        var error: Error?

        func execute() async throws -> [Match] {
            if let error = error {
                throw error
            }
            return matches
        }
    }
}
