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
