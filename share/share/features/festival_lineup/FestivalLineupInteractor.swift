//
//  FestivalLineupInteractor.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// An interactor class that handles the business logic for the Festival Lineup feature.
class FestivalLineupInteractor {
    
    // The view model associated with the Festival Lineup.
    // It is responsible for managing and updating the view's data.
    let viewModel: FestivalLineupViewModel

    // The service responsible for fetching the festival lineup data.
    let service: FestivalLineupService
    
    /// Initializes the interactor with a view model and a service.
    /// - Parameters:
    ///   - viewModel: An instance of `FestivalLineupViewModel`.
    ///   - service: An instance of `FestivalLineupService`.
    init(viewModel: FestivalLineupViewModel, service: FestivalLineupService) {
        self.viewModel = viewModel
        self.service = service
    }
    
    /// Activates the interactor to start processing its business logic.
    /// Typically involves initiating the loading of data.
    func activate() {
        // Indicate that loading of data has started
        viewModel.isLoading = true
        // Begin the process of loading the festival lineup
        loadLineup()
    }
    
    /// Private method to load the festival lineup data.
    private func loadLineup() {
        // Use the service to fetch the lineup data
        service.fetchLineup { [weak self] result in
            // Ensure the following operations are performed on the main thread
            DispatchQueue.main.async {
                self?.viewModel.isLoading = false
                switch result {
                case .success(let artists):
                    self?.viewModel.update(with: artists)
                case .failure(let error):
                    self?.viewModel.update(with: error)
                }
            }
        }
    }
}

