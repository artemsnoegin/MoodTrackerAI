//
//  Cloud.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 09.02.2026.
//

import NaturalLanguage

struct Cloud {
    let reports: [Report]
    
    var tokens: [SentimentToken] {
        let NLService = NaturalLanguageService()
        
        let descriptions = reports.map({ $0.description }).reduce("", { $0 + $1 + " " })
        
        if let language = NLService.language(of: descriptions) {
            if language  == .russian {
                return NLService.retrieveTokens(from: descriptions, using: Rusentilex.dictionary)
            }
        }
        
        return Array(NLService.retrieveTokens(from: descriptions).prefix(10))
    }
}

