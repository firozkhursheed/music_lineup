//
//  FestivalLineupError.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

enum FestivalLineupError: Error {
    case badURL
    case badResponse
    case serverError(statusCode: Int)
    case decodingError
    case networkError(Error)

    var localizedDescription: String {
        switch self {
        case .badURL:
            return "The URL provided was invalid."
        case .badResponse:
            return "Bad response from the server."
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)."
        case .decodingError:
            return "Failed to decode the data."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}
