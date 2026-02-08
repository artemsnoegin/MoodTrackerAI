//
//  WeeklyInsight.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 06.02.2026.
//

import Foundation

struct Summary {
    let reports: [Report]
    
    var averageMoodScore: Score {
        let scores = reports.compactMap { $0.score }
        
        return scores.medianScore
    }
    
    var contributionCount: Int {
        reports.count(where: { $0.score != nil })
    }
    
    var contributionValue: Double {
        guard reports.count > 0 else { return 0.0 }
        
        return Double(contributionCount) / Double(reports.count)
    }
    
    var chartPoints: Array<(date: Date, score: Score)> {
        var data: Array<(date: Date, score: Score)> = []
        
        for report in reports {
            if let score = report.score {
                let normalized = Calendar.current.startOfDay(for: report.date)
                data.append((normalized, score))
            }
        }
        
        return data
    }
    
    var dates: [Date] {
        reports.map {
            let normalized = Calendar.current.startOfDay(for: $0.date)
            return normalized
        }
    }
    
    var scoreValues: [Double] {
        Score.allCases.map { $0.rawValue }
    }
    
    var scoreLabels: [String] {
        Score.allCases.map { $0.title }
    }
    
}
