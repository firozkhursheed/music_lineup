//
//  FestivalLineupViewModel.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A view model class for managing the state and data for the Festival Lineup view.
class FestivalLineupViewModel: ObservableObject {
    // Observable properties that can be observed by SwiftUI views

    @Published var artists: [MusicArtist] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func loadArtists() {
        isLoading = true
    }

    func update(with lineup: [MusicArtist]) {
        self.artists = lineup.map { artist in
            return artist
        }
    }

    func update(with error: FestivalLineupError) {
        self.errorMessage = error.localizedDescription
        isLoading = false
    }
}
