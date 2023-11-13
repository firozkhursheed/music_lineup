//
//  MockFestivalLineupService.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
@testable import share

class MockFestivalLineupService: FestivalLineupService {
    var shouldReturnError = false
    var fetchedArtists: [MusicArtist] = []

    override func fetchLineup(completion: @escaping (Result<[MusicArtist], FestivalLineupError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.networkError(URLError(.notConnectedToInternet))))
        } else {
            completion(.success(fetchedArtists))
        }
    }
}
