//
//  EmotionScorePickerView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 19.01.2026.
//

import SwiftUI

struct EmotionScorePickerView: View {
    @Binding var selection: Score?
    
    var body: some View {
        VStack {
            Text(titleForScore())
                .font(.title2)
                .fontWeight(.medium)
            
            HStack {
                ForEach(Score.allCases, id: \.self) { score in
                    Image(systemName: selection == score ? "circle.fill" : "circle")
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .foregroundStyle(score.color)
                        .onTapGesture {
                            withAnimation {
                                selection = score
                            }
                        }
                }
            }
            .padding()
            .glassEffect(.regular.interactive(), in: ConcentricRectangle(corners: .concentric(minimum: 25), isUniform: true))
        }
    }
    
    private func titleForScore() -> String {
        switch selection {
        case .bad:
            return "I'm bad"
        case .fair:
            return "I'm fair"
        case .okay:
            return "I'm okay"
        case .good:
            return "I'm good"
        case .great:
            return "I'm great"
        default:
            return ""
        }
    }
}
