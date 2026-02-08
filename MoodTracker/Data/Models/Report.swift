//
//  Report.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.
//

import SwiftData
import Foundation

@Model
class Report {
    var date: Date
    
    var score: Score?
    
    var userDescription: String
    
    var sentimentAnalysis: Double?
    
    init(date: Date,
         score: Score? = nil,
         userDescription: String = "",
         sentimentAnalysis: Double? = nil) {
        self.date = date
        self.score = score
        self.userDescription = userDescription
        self.sentimentAnalysis = sentimentAnalysis
    }
}
