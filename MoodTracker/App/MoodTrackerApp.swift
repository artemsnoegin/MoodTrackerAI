//
//  MoodTrackerApp.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 18.01.2026.
//

import SwiftUI
import SwiftData

@main
struct MoodTrackerApp: App {
    @StateObject private var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationRootView(coordinator: coordinator) {
                HomeView(viewModel: coordinator.homeViewModel)
            }
        }
    }
}
