//
//  MusicCardActionView.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-13.
//

import SwiftUI

struct MusicCardActionView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: Strings.Assets.SFImage.heart)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.title)
            
            Image(systemName: Strings.Assets.SFImage.star)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.title)
            
            Image(systemName: Strings.Assets.SFImage.ticket)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.title)

            Spacer()
            
            Image(systemName: Strings.Assets.SFImage.share)
                .font(Theme.Fonts.subheadline)
                .foregroundColor(Theme.TextColor.title)
        }
    }
}
