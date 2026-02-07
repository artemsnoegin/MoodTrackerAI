//
//  ProgressCircle.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI

struct ProgressCircle: View {
    let progress: Double
    let color: Color
    
    var body: some View {
        Text("\(Int(progress * 100))%")
            .foregroundStyle(.primary)
            .font(.caption)
            .bold()
            .padding()
            .overlay {
                Circle()
                    .stroke(color.opacity(0.1), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(color.opacity(0.5),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            }
    }
}

#Preview {
    ProgressCircle(progress: 1, color: .blue)
}
