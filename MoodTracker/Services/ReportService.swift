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
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(_ report: Report) {
        repository.save(report)
    }

    func getLatestReports(count: Int = 7) -> [Report] {
        let calendar = Calendar.current
        
        let now = Date()
        guard let startDate = calendar.date(byAdding: .day, value: -count, to: now)
        else { return [] }
        
        var dates = [now]
        dates += Array(
            calendar.dates(
                byAdding: .day,
                startingAt: startDate,
                in: startDate..<now)
            .reversed()
        )
        
        let reports = repository.fetchReports(
            sortBy: [SortDescriptor(\.date)],
            filterBy: #Predicate { $0.date >= startDate && $0.date <= now }
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
                result.append(Report(date: date))
            }
        }
        
        return result
    }
}
