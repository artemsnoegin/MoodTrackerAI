//
//  SentimentToken.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 09.02.2026.
//

struct SentimentToken: Codable, Hashable {
    let word: String
    let polarity: String
    let score: Double
    let source: String?
}
