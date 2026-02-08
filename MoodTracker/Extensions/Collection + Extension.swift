//
//  Collection + Extension.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 08.02.2026.
//

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
