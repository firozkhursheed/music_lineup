//
//  FestivalLineupService.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A service class responsible for fetching the festival lineup data.
class FestivalLineupService {
    // Network manager instance to handle network requests.
    private let networkManager: NetworkManager

    /// Initializes the service with a network manager.
    /// - Parameter networkManager: An instance of `NetworkManager`. Default is `NetworkManager()`.
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    /// Fetches the music festival lineup.
    /// - Parameter completion: A closure that is called when the fetch operation is complete.
    ///   This closure returns a `Result` type containing an array of `MusicArtist` on success or a `FestivalLineupError` on failure.
    func fetchLineup(completion: @escaping (Result<[MusicArtist], FestivalLineupError>) -> Void) {
        let festivalLineupURL = NetworkConfig.url(for: NetworkConfig.Endpoints.festivalLineup)
        guard let url = festivalLineupURL else {
            completion(.failure(.badURL))
            return
        }

        networkManager.requestData(from: url) { result in
            // Ensure the response handling is performed on the main thread.
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let nestedArtists = try JSONDecoder().decode([[MusicArtist]].self, from: data)
                        // Flatten the nested array of artists into a single array.
                        let artists = nestedArtists.flatMap { $0 }
                        completion(.success(artists))
                    } catch {
                        // Handle any decoding errors.
                        completion(.failure(.decodingError))
                    }
                case .failure(let error):
                    // Handle any network request errors.
                    completion(.failure(error))
                }
            }
        }
    }
}
