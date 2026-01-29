//
//  EditReportViewModel.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.

import SwiftUI
import Combine

class EditReportViewModel: ObservableObject {
    weak var coordinator: Coordinator?
    var reportService: ReportService
    
    @Published var report: Report = Report(date: .now)
    
    @Published var isScorePickerPageComplete: Bool = false
    @Published var isDescriptionPageComplete: Bool = false
    
    init(reportService: ReportService) {
        self.reportService = reportService
        
        $report
            .map { $0.score != nil }
            .assign(to: &$isScorePickerPageComplete)

        $report
            .map { !$0.userDescription.isEmpty }
            .assign(to: &$isDescriptionPageComplete)
    }
    
    func update(_ report: Report) {
        self.report = report
    }
    
    func go(to page: ReportEditPage) {
        coordinator?.go(to: .editReportView(page))
    }
    
    func goBackToHomeView() {
        coordinator?.rootView()
    }
    
    func saveReport() {
        reportService.save(report)
        
        coordinator?.rootView()
    }
}
