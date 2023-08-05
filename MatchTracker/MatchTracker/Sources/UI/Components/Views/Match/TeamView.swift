//
//  TeamView.swift
//  MatchTracker
//
//

import Core
import SDWebImageSwiftUI
import SwiftUI

struct TeamView: View {
    var team: Opponent?
    
    var body: some View {
        VStack(spacing: 10) {
            WebImage(url: URL(string: team?.imageURL ?? ""))
                .placeholder {
                    CoreImage.unavailableImage.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text(team?.name ?? "Sem Nome")
                .font(CoreFont.roboto.regular(size: 10).swiftUIFont)
                .foregroundColor(CoreColor.primary.color)
        }
    }
}
