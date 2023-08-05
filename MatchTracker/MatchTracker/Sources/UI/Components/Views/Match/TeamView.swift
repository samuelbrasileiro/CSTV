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
        VStack(spacing: 0) {
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
                .padding(.bottom, 10)
            Spacer()
            Text(team?.name ?? Localization.Components.Views.TeamView.Name.placehoder)
                .font(CoreFont.roboto.regular(size: 10).swiftUIFont)
                .foregroundColor(CoreColor.primary.color)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: 100)
    }
}
