//
//  FestivalLineupServiceTest.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
import XCTest
@testable import share

class FestivalLineupServiceTest: XCTestCase {

    let jsonString = """
    [
        [
            {
                "name": "Model/Actriz",
                "id": 1,
                "summary": "",
                "location": "pier_stage",
                "date": "2023-09-30T14:00",
                "end": "2023-09-30T14:50",
                "tags": [],
                "artist_ids": [1],
                "artist_info": "Model/Actriz: Model/Actriz is an avant-garde rock band known for their electrifying performances and post-punk influences."
            },
            {
                "name": "Young Fathers",
                "id": 2,
                "summary": "",
                "location": "pier_stage",
                "date": "2023-09-30T15:00",
                "end": "2023-09-30T15:50",
                "tags": [],
                "artist_ids": [2],
                "artist_info": "Young Fathers: Young Fathers are a Mercury Prize-winning Scottish band recognized for their eclectic blend of hip-hop, pop, and electronic music."
            }
        ]
    ]
    """


    func testFetchLineupSuccess() {
        let mockNetworkManager = MockNetworkManager()

        guard let mockData = jsonString.data(using: .utf8) else {
            fatalError("Invalid JSON string")
        }

        mockNetworkManager.mockData = mockData
        let service = FestivalLineupService(networkManager: mockNetworkManager)

        let expectation = self.expectation(description: "Fetch lineup success")
        var responseError: Error?
        var responseArtists: [MusicArtist]?

        service.fetchLineup { result in
            switch result {
            case .success(let artists):
                responseArtists = artists
            case .failure(let error):
                responseError = error
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseArtists)
        XCTAssertEqual(responseArtists?.count, 2)
    }

    func testFetchLineupNetworkFailure() {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.mockError = URLError(.notConnectedToInternet)
        let service = FestivalLineupService(networkManager: mockNetworkManager)

        let expectation = self.expectation(description: "Fetch lineup network failure")
        var responseError: Error?
        var responseArtists: [MusicArtist]?

        service.fetchLineup { result in
            switch result {
            case .success(let artists):
                responseArtists = artists
            case .failure(let error):
                responseError = error
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(responseError)
        XCTAssertNil(responseArtists)
    }
    
    func testFetchLineupInvalidURL() {
        let mockNetworkManager = MockNetworkManager()
        let service = FestivalLineupService(networkManager: mockNetworkManager)

        // Since we're testing invalid URL handling, we don't need to set mockData or mockError on the MockNetworkManager.
        // The service should ideally handle the invalid URL scenario before making a network request.

        var responseError: Error?
        var responseArtists: [MusicArtist]?

        service.fetchLineup { result in
            switch result {
            case .success(let artists):
                responseArtists = artists
            case .failure(let error):
                responseError = error
            }
        }

        XCTAssertNotNil(responseError)
        XCTAssertNil(responseArtists)
    }

    func testFetchLineupMalformedJSON() {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.mockData = "Invalid JSON".data(using: .utf8)
        let service = FestivalLineupService(networkManager: mockNetworkManager)

        let expectation = self.expectation(description: "Fetch lineup malformed JSON")
        var responseError: Error?
        var responseArtists: [MusicArtist]?

        service.fetchLineup { result in
            switch result {
            case .success(let artists):
                responseArtists = artists
            case .failure(let error):
                responseError = error
            }
            expectation.fulfill()
        }

        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(responseError)
        XCTAssertNil(responseArtists)
    }
}
