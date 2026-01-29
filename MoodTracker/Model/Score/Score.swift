//
//  Score.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 19.01.2026.
//

import SwiftData

enum Score: Double, CaseIterable, Equatable, Codable {
    case bad = -1
    case fair = -0.5
    case okay = 0
    case good = 0.5
    case great = 1
}
