//
//  Report + Extension.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 26.01.2026.
//

import SwiftUI

extension Report {

    var dateShort: String {
        if Calendar.current.isDateInToday(date) {
            "Today"
        } else {
            date.formatted(.dateTime.day().weekday(.abbreviated))
        }
    }
    
    var dateLong: String {
        if Calendar.current.isDateInToday(date) {
            "Today"
        } else {
            date.formatted(.dateTime.day().weekday(.wide))
        }
    }
    
    var title: String {
        if let score = score {
            if Calendar.current.isDateInToday(date) {
                return "Today\nis \(score)"
            } else {
                return "\(dateLong)\nwas \(subtitle)"
            }
        } else {
            if Calendar.current.isDateInToday(date) {
                return "You did't report\ntoday"
            } else {
                return "You did report\non \(dateLong)"
            }
        }
    }
    
    var description: String {
        userDescription
    }
    
    var subtitle: String {
        score?.title ?? "..."
    }
    
    var imageName: String {
        score?.imageName ?? "question_mark"
    }
    
    var color: Color {
        score?.color ?? .clear
    }
}
