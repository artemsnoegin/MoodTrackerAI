//
//  Trend + Extension.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 07.02.2026.
//

import SwiftUI

extension Trend {
    
    var avergageColor: Color {
        color(for: averageChange)
    }
    
    var stabilityColor: Color {
        color(for: stabilityChange, inverted: true)
    }
    
    var contributionColor: Color {
        color(for: Double(contributionChange))
    }
    
    private func color(for value: Double, inverted: Bool = false) -> Color {
        if value > 0 {
            return inverted ? .red : .green
        } else if value < 0 {
            return inverted ? .green : .red
        } else {
            return .yellow
        }
    }
}
