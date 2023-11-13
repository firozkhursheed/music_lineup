//
//  FestivalLineupView.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
import SwiftUI

struct FestivalLineupView: View {
    @ObservedObject var viewModel: FestivalLineupViewModel
    let itemSpacing: CGFloat = 10
    let cardHeight: CGFloat = 370
    let centerCardWidth: Double = 0.6  // Item width is 60% of the screen width
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let maxImageHeight = screenHeight * 0.3 // 30% of the screen's height
            
            VStack(alignment: .leading) {
                FestivalLineupHeaderView(isAnimating: $isAnimating, height: maxImageHeight, width: geometry.size.width)
                
                // Display a loading indicator when data is being loaded
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                }
                
                // Display an error message if there is an error
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Only show the ScrollView when not loading and no error
                if !viewModel.isLoading && viewModel.errorMessage == nil {
                    GeometryReader { fullView in
                        let itemWidth = fullView.size.width * centerCardWidth
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: itemSpacing) {
                                // TODO: Repleace it with reusable view, right now List view does not support horizontal scrolling
                                ForEach(viewModel.artists, id: \.uniqueIdentifier) { artist in
                                    GeometryReader { geo in
                                        ArtistCardView(artist: artist)
                                            .frame(width: itemWidth)
                                            .scaleEffect(scaleValue(fullView: fullView, geo: geo, itemWidth: itemWidth))
                                    }
                                    .frame(width: itemWidth)
                                }
                            }
                            .padding(.horizontal, (fullView.size.width - itemWidth) / 2)
                        }
                    }
                    .frame(height: cardHeight)
                }
            }
        }
        .background(Color.black)
    }
    
    private func scaleValue(fullView: GeometryProxy, geo: GeometryProxy, itemWidth: CGFloat) -> CGFloat {
        let midPoint = fullView.size.width / 2
        let viewFrame = geo.frame(in: .global)
        var scale: CGFloat = 1.0
        
        let diff = abs(midPoint - viewFrame.midX)
        if diff < itemWidth {
            scale = 1 + (1 - diff / itemWidth) * 0.2 // 0.2 is the max scale-up factor
        }
        
        return scale
    }
}
