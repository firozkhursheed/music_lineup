//
//  shareApp.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import SwiftUI

@main
struct shareApp: App {
    let router: FestivalLineupRouter

    init() {
        let networkManager = NetworkManager() // Or a mock version for testing
        let service = FestivalLineupService(networkManager: networkManager)
        let builder = FestivalLineupBuilder().with(service: service)
        router = builder.build()
        router.start() // Start the router
    }
    
    var body: some Scene {
        WindowGroup {
            FestivalLineupView(viewModel: router.interactor.viewModel)
        }
    }
}
