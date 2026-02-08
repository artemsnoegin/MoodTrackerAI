//
//  ReportService.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 24.01.2026.
//

import Foundation
import SwiftData

// TODO: Report Service async

class ReportService {
    let repository: Repository
    
    private let calendar = Calendar.current
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(_ report: Report) {
        repository.save(report)
    }

    func getLatestReports(count: Int = 7, reversed: Bool = false) -> [Report] {
        
        let now = Date()
        guard let startDate = calendar.date(byAdding: .day, value: -count, to: now)
        else { return [] }
        
        return getReports(from: startDate, to: now, reversed: reversed)
    }
    
    func getReports(from start: Date, to end: Date, reversed: Bool = false) -> [Report] {
        var dates = Array(calendar.dates(
            byAdding: .day,
            startingAt: start,
            in: start..<end)
        )
        dates.append(end)
        
        if reversed {
            dates.sort(by: >)
        }
        
        let reports = repository.fetchReports(
            sortBy: [SortDescriptor(\.date)],
            filterBy: #Predicate { $0.date >= start && $0.date <= end }
        )
        var reportsMap = [Date:Report]()
        
        for report in reports {
            let normalized = calendar.startOfDay(for: report.date)
            reportsMap[normalized] = report
        }
        
        var result = [Report]()
        
        for date in dates {
            let normalized = calendar.startOfDay(for: date)
            if let report = reportsMap[normalized] {
                result.append(report)
            } else {
                result.append(Report(date: normalized))
            }
        }
        return result
    }
}
