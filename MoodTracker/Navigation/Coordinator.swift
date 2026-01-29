//
// Coordinator.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 21.01.2026.
//

import Combine

class Coordinator: ObservableObject {
    @Published var navigationPath: [NavigationDestination] = []
    
    lazy var homeViewModel = {
        let vm = HomeViewModel(reportService: reportService)
        vm.coordinator = self
        return vm
    }()
    
    lazy var editReportViewModel = {
        let vm = EditReportViewModel(reportService: reportService)
        vm.coordinator = self
        return vm
    }()
    
    private lazy var reportService: ReportService = {
        let repository: Repository = SwiftDataRepository()
        return ReportService(repository: repository)
    }()
    
    func editReportFlow(with report: Report) {
        editReportViewModel.update(report)
        navigationPath.append(.editReportView())
    }

    func go(to destination: NavigationDestination) {
        navigationPath.append(destination)
    }
    
    func rootView() {
        navigationPath.removeAll()
    }
}
