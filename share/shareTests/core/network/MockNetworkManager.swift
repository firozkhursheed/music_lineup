//
//  MockNetworkManager.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
@testable import share

class MockNetworkManager: NetworkManager {
    var mockData: Data?
    var mockError: Error?


    override func requestData(from url: URL, completion: @escaping (Result<Data, FestivalLineupError>) -> Void) {
        if let error = mockError {
            completion(.failure(.networkError(error)))
        } else if let data = mockData {
            completion(.success(data))
        }
    }
}
