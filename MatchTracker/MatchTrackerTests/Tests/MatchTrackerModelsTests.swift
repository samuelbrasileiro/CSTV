//
//  MatchTrackerModelsTests.swift
//  MatchTrackerTests
//
//

import XCTest
import Combine
@testable import MatchTracker

class MatchTests: XCTestCase {
    
    func testGetTitle() {
        // Dado uma partida com liga e série
        let match = Match(league: League(name: "Liga A"),
                          name: "Partida de exemplo",
                          serie: Serie(name: "Principal"))
        
        // Quando chamamos a função getTitle()
        let title = match.getTitle()
        
        // Então deve retornar o título corretamente
        XCTAssertEqual(title, "Liga A + Principal")
    }
    
    func testGetTitleMissingLeague() {
        // Dado uma partida sem liga
        let matchWithoutLeague = Match(league: nil,
                                       name: "Partida de exemplo 2",
                                       serie: Serie(name: "Série"))
        
        // Quando chamamos a função getTitle()
        let title = matchWithoutLeague.getTitle()
        
        // Então deve retornar apenas o nome da série
        XCTAssertEqual(title, "Série")
    }
    
    func testGetTitleMissingSeries() {
        // Dado uma partida sem série
        let matchWithoutLeague = Match(league: League(name: "Liga A"),
                                       name: "Partida de exemplo 2",
                                       serie: nil)
        
        // Quando chamamos a função getTitle()
        let title = matchWithoutLeague.getTitle()
        
        // Então deve retornar apenas o nome da liga
        XCTAssertEqual(title, "Liga A")
    }
    
}
