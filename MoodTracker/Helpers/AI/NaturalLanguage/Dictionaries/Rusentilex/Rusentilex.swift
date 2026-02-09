//
//  Rusentilex.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 09.02.2026.
//

import Foundation

struct Rusentilex: Codable {
    private let words: [String: SentimentToken]
    
    static var dictionary: [String: SentimentToken] {
        guard let url = Bundle.main.url(forResource: "Rusentilex",
                                        withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            debugPrint("RusentilexJSON not found")
            return [:]
        }
        
        do {
            return try JSONDecoder().decode(Rusentilex.self,
                                            from: data).words
        }
        catch {
            debugPrint("ERROR decoding RusentilexJSON: \(error.localizedDescription)")
            return [:]
        }
    }
}
