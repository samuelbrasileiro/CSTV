//
//  TeamPlayersView.swift
//  MatchTracker
//
//

import SwiftUI

struct TeamPlayersView: View {
    @Binding var players: [Player]
    
    var isLeftAligned: Bool = false
    
    var body: some View {
        VStack {
            LazyVStack(spacing: 16) {
                ForEach($players, id: \.id) { player in
                    PlayerView(player: player, isLeftAligned: isLeftAligned)
                }
            }
            Spacer()
        }
    }
}
