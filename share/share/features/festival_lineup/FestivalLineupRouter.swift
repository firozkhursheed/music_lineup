//
//  FestivalLineupRouter.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A router class responsible for managing navigation and coordination for the Festival Lineup feature.
class FestivalLineupRouter {
    
    // The interactor associated with this router.
    // The interactor contains the business logic for the Festival Lineup feature.
    let interactor: FestivalLineupInteractor
    
    /// Initializes the router with an interactor.
    /// - Parameter interactor: An instance of `FestivalLineupInteractor`.
    init(interactor: FestivalLineupInteractor) {
        self.interactor = interactor
    }
    
    /// Starts the routing for the Festival Lineup feature.
    /// Typically, this involves activating the interactor to begin its work.
    func start() {
        // Activate the interactor, triggering it to start handling its business logic.
        interactor.activate()
    }
}
