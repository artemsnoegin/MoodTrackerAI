//
//  InsightViewCell.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 07.02.2026.
//

import SwiftUI

struct InsightViewCell<Content: View>: View {
    var title: String?
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            content()
        }
        .padding()
        .glassEffect(.regular.interactive(),
                     in: RoundedRectangle(cornerRadius: 25))
        .padding()
    }
}
