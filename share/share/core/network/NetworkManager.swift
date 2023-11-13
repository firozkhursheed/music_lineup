//
//  NetworkManager.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A class responsible for managing network requests.
class NetworkManager {
    /// Performs a network request to fetch data from a specified URL.
    /// - Parameters:
    ///   - url: The URL from which to request data.
    ///   - completion: A closure called when the request is complete. It returns a result type that contains either the data or an error.
    func requestData(from url: URL, completion: @escaping (Result<Data, FestivalLineupError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle any errors returned by the task.
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.badResponse))
                return
            }

            switch httpResponse.statusCode {
            case 200...299:
                completion(.success(data ?? Data()))
            default:
                completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
            }
        }.resume()
    }
}
