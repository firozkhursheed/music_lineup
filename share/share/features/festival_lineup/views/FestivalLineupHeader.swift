//
//  FestivalLineupHeader.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-13.
//

import SwiftUI

struct FestivalLineupHeaderView: View {
    @Binding var isAnimating: Bool
    let height: CGFloat
    let width: CGFloat

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(Strings.Assets.music)
                .resizable()
                .scaledToFill()
                .frame(width: width)
                .clipped()
                .frame(height: height)
                .edgesIgnoringSafeArea(.top)
        }

        HStack {
            Text(Strings.FestivalLineup.title)
                .font(Theme.Fonts.largeTitle.weight(.heavy))
                .frame(alignment: .leading)
                .padding([.leading]) // Add padding to leading
                .foregroundColor(Theme.TextColor.primary)
            
            Image(systemName: Strings.Assets.SFImage.musicNote)
                .font(Theme.Fonts.largeTitle.weight(.heavy))
                .foregroundColor(Theme.TextColor.primary)
                .offset(y: isAnimating ? -5 : 5)
                .onAppear {
                    withAnimation(Animation.linear(duration: 0.6).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
                .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: true), value: isAnimating)
        }
    }
}
