//
//  WordCloudView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 08.02.2026.
//

import SwiftUI

struct WordCloudView: View {
    var cloud: Cloud

    var body: some View {
        CloudLayout(spacing: 8) {
            ForEach(cloud.tokens, id: \.self) { token in
                Text(token.word)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(color(for: token).opacity(0.1), in: .capsule)
            }
        }
        .padding(.top)
    }
    
    func color(for token: SentimentToken) -> Color {
        guard token.polarity != "unknown" else {
            return .gray
        }
        
        if token.score > 0 {
            return Score.great.color
        } else if token.score < 0 {
            return Score.bad.color
        } else {
            return Score.okay.color
        }
    }
}
