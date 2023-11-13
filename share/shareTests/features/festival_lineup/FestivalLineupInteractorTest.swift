//
//  FestivalLineupInteractorTest.swift
//  shareTests
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import XCTest
@testable import share

class FestivalLineupInteractorTest: XCTestCase {

    // Test for Successful Data Loading
    func testInteractorLoadsDataSuccessfully() {
        let mockService = MockFestivalLineupService()
        let testViewModel = TestFestivalLineupViewModel()
        let interactor = FestivalLineupInteractor(viewModel: testViewModel, service: mockService)
        mockService.fetchedArtists = [MusicArtist(name: "Test Artist", id: 1, summary: "", location: "", date: "", end: "", tags: [], artist_ids: [], artist_info: "")]
        mockService.shouldReturnError = false
        
        let expectation = self.expectation(description: "Data load success")
        interactor.activate()

        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
        
        XCTAssertTrue(testViewModel.didUpdateArtists)
        XCTAssertFalse(testViewModel.didReceiveError)
    }

    // Test for Error Handling
    func testInteractorHandlesError() {
        let mockService = MockFestivalLineupService()
        let testViewModel = TestFestivalLineupViewModel()
        let interactor = FestivalLineupInteractor(viewModel: testViewModel, service: mockService)
        mockService.shouldReturnError = true

        let expectation = self.expectation(description: "Data load success")
        interactor.activate()

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        
        waitForExpectations(timeout: 1)
        XCTAssertFalse(testViewModel.didUpdateArtists)
        XCTAssertTrue(testViewModel.didReceiveError)
    }

    // Test Initial Activation
    func testInteractorInitialActivation() {
        let mockService = MockFestivalLineupService()
        let testViewModel = TestFestivalLineupViewModel()
        let interactor = FestivalLineupInteractor(viewModel: testViewModel, service: mockService)

        interactor.activate()
        
        XCTAssertTrue(testViewModel.isLoading)
    }

    func testInteractorLoadingState() {
        let mockService = MockFestivalLineupService()
        let testViewModel = TestFestivalLineupViewModel()
        let interactor = FestivalLineupInteractor(viewModel: testViewModel, service: mockService)

        // Check initial loading state
        XCTAssertFalse(testViewModel.isLoading)
        XCTAssertFalse(testViewModel.isLoadingStateChanged)

        // Activate the interactor
        interactor.activate()

        // Use an expectation if the service call is asynchronous
        let expectation = self.expectation(description: "Loading state change")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1) // Adjust the timeout as necessary

        // Check if loading state was updated
        XCTAssertTrue(testViewModel.isLoadingStateChanged)
    }

    // Additional tests can be added here as needed
}
