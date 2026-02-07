//
//  InsightsViewModel.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 29.01.2026.
//

import Combine

class InsightsViewModel: ObservableObject {
    weak var coordinator: Coordinator?
    private let reportService: ReportService
    
    @Published var reports: [Report] = []

    var averageMoodScore: Score {
        let mid = reports.count / 2
        let scores = reports[..<mid].compactMap { $0.score }
        
        return scores.medianScore
    }
    
    init(reportService: ReportService) {
        self.reportService = reportService
    }
    
    func loadReports() {
        reports = reportService.getLatestReports(count: 14)
    }
    
    func summary() -> Summary {
        let latestReport = Array(reports.prefix(7))
        return Summary(reports: latestReport)
    }
    
    func trend() -> Trend {
        Trend(comparing: reports)
    }
}
