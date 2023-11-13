//
//  TestFestivalLineupViewModel.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
@testable import share

class TestFestivalLineupViewModel: FestivalLineupViewModel {
    var didUpdateArtists = false
    var didReceiveError = false

    var isLoadingStateChanged = false
    var initialLoadingState: Bool = false
    
    override func update(with lineup: [MusicArtist]) {
        didUpdateArtists = true
        super.update(with: lineup)
    }

    override func update(with error: FestivalLineupError) {
        didReceiveError = true
        super.update(with: error)
    }
    
    override var isLoading: Bool {
        didSet {
            isLoadingStateChanged = true
            initialLoadingState = oldValue
        }
    }
}
