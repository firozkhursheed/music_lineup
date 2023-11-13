//
//  NetworkConfig.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-13.
//

import Foundation

/// Network configuration for the app.
enum NetworkConfig {
    static let baseURL = URL(string: "http://localhost:8000/")

    /// Nested enum to store endpoint paths.
    enum Endpoints {
        static let festivalLineup = "fest_lineup.json"
    }

    /// Constructs a complete URL for a given endpoint.
    /// - Parameter endpoint: The endpoint path.
    /// - Returns: A complete URL or `nil` if the baseURL is not correctly configured.
    static func url(for endpoint: String) -> URL? {
        return baseURL?.appendingPathComponent(endpoint) ?? nil
    }
}
