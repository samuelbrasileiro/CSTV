//
//  PlayerView.swift
//  MatchTracker
//
//

import Core
import SDWebImageSwiftUI
import SwiftUI

struct PlayerView: View {
    @Binding var player: Player
    var isLeftAligned: Bool = true
    
    @State private var isImageEmpty = false

    var body: some View {
        HStack {
            if isLeftAligned {
                Spacer()
                playerInfo
                    .padding(.trailing, 16)
                playerImage
            } else {
                playerImage
                playerInfo
                    .padding(.leading, 16)
                Spacer()
            }
        }
        .padding(.leading, 8)
        .padding(.trailing, 12)
        .background(CoreColor.secondaryBackground.color)
        .cornerRadius(12, corners: isLeftAligned ? [.topRight, .bottomRight] : [.topLeft, .bottomLeft])
    }
    
    @ViewBuilder
    private var playerInfo: some View {
        VStack(alignment: isLeftAligned ? .trailing : .leading, spacing: 4) {
            Text(player.name ?? Localization.Components.Views.PlayerView.Nickname.placeholder)
                .font(CoreFont.roboto.bold(size: 14).swiftUIFont)
                .lineLimit(1)
                .foregroundColor(CoreColor.primary.color)
            
            Text(player.firstName ?? Localization.Components.Views.PlayerView.Name.placeholder)
                .font(CoreFont.roboto.regular(size: 12).swiftUIFont)
                .foregroundColor(CoreColor.secondary.color)
                .lineLimit(1)
        }
    }
    
    @ViewBuilder
    private var playerImage: some View {
        if !isImageEmpty {
            WebImage(url: URL(string: player.imageURL ?? ""))
                .onFailure { _ in
                    isImageEmpty = true
                }
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .clipped()
        } else {
            CoreImage.unavailableImage.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
