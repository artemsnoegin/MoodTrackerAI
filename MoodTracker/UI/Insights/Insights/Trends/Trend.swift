//
//  Trend.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 06.02.2026.
//

import Foundation

struct Trend {
    private let reports: [Report]
    
    init(comparing reports: [Report]) {
        self.reports = reports
    }
    
    var averageChange: Double {
        average(from: currentScores) - average(from: previousScores)
    }
    
    var averageIcon: String {
        icon(for: averageChange)
    }
    
    var averagePercentage: String {
        percentage(for: averageChange)
    }
    
    var averageDescription: String {
        if averageChange == 0 {
            return "Average wellness is stable"
        } else if averageChange > 0 {
            return "Average wellness increased"
        } else {
            return "Average wellness decreased"
        }
    }
    
    var stabilityChange: Double {
        volatility(from: previousScores) - volatility(from: currentScores)
    }
    
    var stabilityIcon: String {
        icon(for: stabilityChange)
    }
    
    var stabilityPercentage: String {
        percentage(for: stabilityChange)
    }
    
    var stabilityDescription: String {
        if stabilityChange == 0 {
            return "Mood swings are't present"
        }else if stabilityChange > 0 {
            return "Mood swings increased"
        } else {
            return "Mood swings stabilized"
        }
    }
    
    var contributionChange: Int {
        previousScores.count - currentScores.count
    }
    
    var contributionIcon: String {
        icon(for: Double(contributionChange))
    }
    
    var contributionTitle: String {
        if contributionChange > 0 {
            return "+\(contributionChange)"
        } else if contributionChange < 0 {
            return "\(contributionChange)"
        } else {
            return "stable"
        }
    }
    
    var contributionDescription: String {
        if currentScores.count == currentReports.count {
            return "You reported every day"
        } else {
            return "You reported \(currentScores.count) times"
        }
    }
    
    private func percentage(for value: Double) -> String {
        value.formatted(
            .percent
                .sign(strategy: .always())
                .precision(.fractionLength(0...1))
        )
    }
    
    private func icon(for value: Double, inverted: Bool = false) -> String {
        if value > 0 {
            return "arrow.up"
        } else if value < 0 {
            return "arrow.down"
        } else {
            return "minus"
        }
    }
    
    private var currentReports: [Report] {
        let mid = reports.count / 2
        return Array(reports[..<mid])
    }
    
    private var previousReports: [Report] {
        let mid = reports.count / 2
        return Array(reports[mid...])
    }
    
    private var currentScores: [Double] {
        currentReports.compactMap { $0.score?.rawValue }
    }
    
    private var previousScores: [Double] {
        previousReports.compactMap { $0.score?.rawValue }
    }

    private func average(from values: [Double]) -> Double {
        guard !values.isEmpty else { return 0 }
        
        return values.reduce(0, +) / Double(values.count)
    }
    
    private func volatility(from values: [Double]) -> Double {
        guard !values.isEmpty else { return 0 }
        
        let variance = values
            .map { pow($0 - average(from: values), 2) }
            .reduce(0, +) / Double(values.count)
        
        return sqrt(variance)
    }
}
