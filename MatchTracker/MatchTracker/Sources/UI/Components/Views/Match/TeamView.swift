//
//  TeamView.swift
//  MatchTracker
//
//

import Core
import SDWebImageSwiftUI
import SwiftUI

struct TeamView: View {
    var team: Team?
    
    @State private var isImageEmpty = false
    
    var body: some View {
        VStack(spacing: 0) {
            if !isImageEmpty {
                WebImage(url: URL(string: team?.imageURL ?? ""))
                    .onFailure { _ in
                        isImageEmpty = true
                    }
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 10)
            } else {
                CoreImage.unavailableImage.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
            }
            Spacer(minLength: 0)
            Text(team?.name ?? Localization.Components.Views.TeamView.Name.placehoder)
                .font(CoreFont.roboto.regular(size: 10).swiftUIFont)
                .foregroundColor(CoreColor.primary.color)
                .lineLimit(3)
                .multilineTextAlignment(.center)
            Spacer(minLength: 0)
        }
        .frame(maxWidth: 60)
    }
}
