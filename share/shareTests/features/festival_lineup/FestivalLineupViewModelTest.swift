//
//  FestivalLineupViewModelTest.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
import XCTest
@testable import share

class FestivalLineupViewModelTest: XCTestCase {

    func testInitialViewModelState() {
        let viewModel = FestivalLineupViewModel()

        XCTAssertTrue(viewModel.artists.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testViewModelUpdateOnSuccess() {
        let viewModel = FestivalLineupViewModel()
        let artists = [MusicArtist(
            name: "James Artist",
            id: 1,
            summary: "Summary of James",
            location: "LA",
            date: "2023-09-30T14:00",
            end: "2023-09-30T14:50",
            tags: ["tag-1", "tag-2"],
            artist_ids: [1],
            artist_info: "Artist Info")
        ]

        viewModel.update(with: artists)

        XCTAssertEqual(viewModel.artists.count, 1)
        XCTAssertEqual(viewModel.artists.first?.artistName, "James Artist")
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testViewModelUpdateOnError() {
        let viewModel = FestivalLineupViewModel()
        let sampleError = FestivalLineupError.networkError(URLError(.notConnectedToInternet))

        viewModel.update(with: sampleError)

        XCTAssertTrue(viewModel.artists.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
    }

    func testViewModelLoadingState() {
        let viewModel = FestivalLineupViewModel()

        viewModel.isLoading = true

        XCTAssertTrue(viewModel.isLoading)

        viewModel.isLoading = false

        XCTAssertFalse(viewModel.isLoading)
    }

}
