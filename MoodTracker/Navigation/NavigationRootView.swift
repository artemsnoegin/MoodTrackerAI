//
//  RootView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.
//

import SwiftUI

struct NavigationRootView<Root: View>: View {
    @ObservedObject var coordinator: Coordinator
    @ViewBuilder let rootView: () -> Root
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            rootView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .editReportView(let page):
                        EditReportView(page: page)
                    case .calendar:
                        CalendarView()
                    case .insights:
                        EmptyView()
                    case .userSettings:
                        EmptyView()
                    }
                }
        }
        .environmentObject(coordinator.editReportViewModel)
    }
}
