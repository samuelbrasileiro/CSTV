//
//  MatchItemView.swift
//  MatchTracker
//
//

import Commons
import Core
import SDWebImageSwiftUI
import SwiftUI

struct MatchItemView: View {
    @Binding var match: Match
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    MatchTeamsView(match: $match)
                    Spacer()
                }
                .padding(.top, 42)
                .padding(.bottom, 12)
                .padding(.horizontal, 12)
                Rectangle()
                    .foregroundColor(CoreColor.primary.color.opacity(0.2))
                    .frame(height: 1)
                footerView()
            }
            .background(CoreColor.secondaryBackground.color)
            tagView()
        }
        .cornerRadius(16)
        .clipped()
    }
    
    @ViewBuilder
    func footerView() -> some View {
        HStack(spacing: 8) {
            WebImage(url: URL(string: match.league?.imageURL ?? ""))
                .placeholder {
                    CoreImage.unavailableImage.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                        .clipShape(Circle())
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
            
            Text(match.getTitle())
                .font(CoreFont.roboto.regular(size: 8).swiftUIFont)
                .foregroundColor(CoreColor.primary.color)
            Spacer()
        }
        .padding(.leading, 16)
        .padding(.vertical, 8)
        .padding(.trailing, 8)
    }
    
    @ViewBuilder
    func tagView() -> some View {
        let beginAt = match.beginAt ?? .distantFuture
        Text(beginAt.formattedDate())
            .font(CoreFont.roboto.bold(size: 8).swiftUIFont)
            .multilineTextAlignment(.center)
            .foregroundColor(CoreColor.primary.color)
            .padding(8)
            .background( beginAt <= .now ?
                         MatchTrackerColor.online.color
                         : MatchTrackerColor.offline.color)
            .cornerRadius(16, corners: [.topRight, .bottomLeft])
    }
}
