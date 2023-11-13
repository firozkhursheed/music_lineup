//
//  ArtistCardView.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
import SwiftUI

struct ArtistCardView: View {
    var artist: MusicArtist

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(artist.artistName)
                .font(Theme.Fonts.largeTitle.weight(.black))
                .foregroundColor(Theme.TextColor.title)
                
            Label(artist.formattedDate, systemImage: Strings.Assets.SFImage.calendar)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.body1)

            Label(artist.formattedTime, systemImage: Strings.Assets.SFImage.clock)
                .font(Theme.Fonts.caption.bold())
                .foregroundColor(Theme.TextColor.body1)

            Label(artist.location, systemImage: Strings.Assets.SFImage.figureWalk)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.body1)
            
            Text(artist.artist_info)
                .font(Theme.Fonts.body)
                .foregroundColor(Theme.TextColor.body2)
            
            MusicCardActionView()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.backgroundColor)
        .cornerRadius(16)
        .padding(.maximum(4, 30))
    }
}
