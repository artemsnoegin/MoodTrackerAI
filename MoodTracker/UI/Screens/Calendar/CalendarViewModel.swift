//
//  CalendarViewModel.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    let reportService: ReportService
    var today: Date = .now
    
    var monthOffsetValue = 0
    
    var labels: [String] {
        ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    }
    
    @Published var reports: [Report] = []
    @Published var missing: [String] = []
    @Published var canGoForward = false
    @Published var selection: Report?
    
    init(reportService: ReportService) {
        self.reportService = reportService
        loadReports()
    }
    
    private func loadReports() {
        let calendar = Calendar.current
        let now = Date()
        let curMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now))!
        let targetMonth = calendar.date(byAdding: .month, value: monthOffsetValue, to: curMonth)!
        let start = calendar.dateInterval(of: .weekOfMonth, for: targetMonth)!.start
        var end = calendar.date(byAdding: .day, value: 42, to: start)!
        if end > now {
            end = now
        }
        let reports = reportService.getReports(from: start, to: end)
        self.reports = reports
        
        today = Calendar.current.date(byAdding: .month, value: monthOffsetValue, to: reports.last!.date)!
    }
    
    func nextMonth() {
        guard monthOffsetValue < 0 else { return }
        
        monthOffsetValue += 1
        if monthOffsetValue == 0 {
            canGoForward = false
        }
        loadReports()
    }
    
    func previousMonth() {
        monthOffsetValue -= 1
        if !canGoForward { canGoForward = true }
        loadReports()
    }
}
