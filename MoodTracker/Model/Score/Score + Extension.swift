//
//  Score + Extension.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 26.01.2026.
//

import SwiftUI

extension Score {
    var title: String {
        switch self {
        case .bad:
            return "bad"
        case .fair:
            return "fair"
        case .okay:
            return "okay"
        case .good:
            return "good"
        case .great:
            return "great"
        }
    }
    
    var imageName: String {
        switch self {
        case .bad:
            return "face_bad"
        case .fair:
            return "face_fair"
        case .okay:
            return "face_okay"
        case .good:
            return "face_good"
        case .great:
            return "face_great"
        }
    }
    
    var color: Color {
        switch self {
        case .bad:
            return Color.pink
        case .fair:
            return Color.purple
        case .okay:
            return Color.cyan
        case .good:
            return Color.yellow
        case .great:
            return Color.green
        }
    }
}

extension Collection where Element == Double {
    var median: Double {
        guard !isEmpty else { return 0.0 }
        
        let sorted = self.sorted()
        let count = sorted.count
        
        if count % 2 == 1 {
            return sorted[count / 2]
        } else {
            let mid1 = sorted[(count - 1) / 2]
            let mid2 = sorted[count / 2]
            return (mid1 + mid2) / 2.0
        }
    }
}

extension Collection where Element == Score {
    var medianScore: Score {
        guard !isEmpty else { return .okay }
        let values = self.map { $0.rawValue }
        
        switch values.median {
        case ..<(-0.6):
            return .bad
        case ..<(-0.2):
            return .fair
        case ..<0.2:
            return .okay
        case ..<0.6:
            return .good
        default:
            return .great
        }
    }
}
