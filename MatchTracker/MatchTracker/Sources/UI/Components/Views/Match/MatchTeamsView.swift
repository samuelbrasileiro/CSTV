//
//  MatchTeamsView.swift
//  MatchTracker
//
//

import Core
import SDWebImageSwiftUI
import SwiftUI

struct MatchTeamsView: View {
    @Binding var match: Match
    
    private var team1: Opponent? {
        match.opponents?[safe: 0]?.opponent
    }
    
    private var team2: Opponent? {
        match.opponents?[safe: 1]?.opponent
    }
    
    var body: some View {
        HStack {
            TeamView(team: team1)
            Text("vs")
                .font(CoreFont.roboto.regular(size: 12))
                .foregroundColor(CoreColor.primary.color.opacity(0.5))
                .padding(.horizontal, 20)
            TeamView(team: team2)
        }
    }
    
}
