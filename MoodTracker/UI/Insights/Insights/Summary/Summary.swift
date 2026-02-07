//
//  WeeklyInsight.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 06.02.2026.
//

struct Summary {
    let reports: [Report]
    
    var uniqueScores: [Score] {
        Array(Set(reports.compactMap { $0.score }).sorted(by: { $0.rawValue < $1.rawValue }))
    }
    
    var actualReports: [Report] {
        reports.filter { $0.score != nil }
    }
    
    var daysCount: Int {
        reports.count
    }
    
    var daysWithReportCount: Int {
        reports.count(where: {$0.score != nil})
    }
    
    var contribution: Double {
        (daysCount > 0) ? Double(daysWithReportCount) / Double(daysCount) : 0.0
    }
    
    var contributionPercent: Int {
        Int((daysCount > 0) ? Double(daysWithReportCount) / Double(daysCount) * 100 : 0.0)
    }
    
    
    var averageMoodScore: Score {
        let scores = reports.compactMap { $0.score }
        
        return scores.medianScore
    }
}
