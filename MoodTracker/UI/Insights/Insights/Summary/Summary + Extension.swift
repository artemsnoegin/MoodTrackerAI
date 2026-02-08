//
//  Summary + Extension.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 08.02.2026.
//

import SwiftUI

extension Summary {
    var colors: [Color] {
        let unique = Set(chartPoints.map { $0.score })
        let colors = unique.sorted(by: { $0.rawValue > $1.rawValue }).map { $0.color }
        return colors
    }
}
