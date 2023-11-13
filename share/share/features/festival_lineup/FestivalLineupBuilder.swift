//
//  FestivalLineupBuilder.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A builder class for constructing the components needed for the Festival Lineup feature.
class FestivalLineupBuilder {
    // Optional property to hold a custom `FestivalLineupService` instance.
    // This allows for dependency injection, useful for testing or alternate implementations.
    private var service: FestivalLineupService?

    /// Sets a custom service for the builder.
    /// - Parameter service: A `FestivalLineupService` instance to be used in the construction of the lineup components.
    /// - Returns: The same `FestivalLineupBuilder` instance (allows for method chaining).
    func with(service: FestivalLineupService) -> FestivalLineupBuilder {
        self.service = service
        return self
    }

    /// Constructs and returns a `FestivalLineupRouter` with all necessary dependencies.
    /// - Returns: A fully constructed `FestivalLineupRouter` instance.
    func build() -> FestivalLineupRouter {
        // Use the provided service or create a new default instance if none was provided.
        let service = self.service ?? FestivalLineupService()
        
        // Instantiate the view model.
        let viewModel = FestivalLineupViewModel()
        
        // Instantiate the interactor with the view model and service.
        let interactor = FestivalLineupInteractor(viewModel: viewModel, service: service)
        
        // Instantiate and return the router with the interactor.
        return FestivalLineupRouter(interactor: interactor)
    }
}

