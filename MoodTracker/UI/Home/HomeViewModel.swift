//
//  HomeViewModel.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 21.01.2026.
//

import Combine
import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    weak var coordinator: Coordinator?
    let reportService: ReportService
    
    @Published var reports: [Report] = []
    @Published var selectedReport: Report = Report(date: .now)
    
    init(reportService: ReportService) {
        self.reportService = reportService
        
        $reports
            .map { days in
                if let today = days.first {
                    return today
                } else {
                    return Report(date: .now)
                }
            }
            .assign(to: &$selectedReport)
    }

    func loadReports() {
        reports = reportService.getLatestReports(reversed: true)
    }
    
    func updateReport() {
        coordinator?.editReportFlow(with: selectedReport)
    }
    
    func showCalendar() {
        coordinator?.go(to: .calendar)
    }
    
    func showInsights() {
        coordinator?.go(to: .insights)
    }
    
    func showUserSettings() {
        coordinator?.go(to: .userSettings)
    }
}
