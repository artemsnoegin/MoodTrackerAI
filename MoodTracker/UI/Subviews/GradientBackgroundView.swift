//
//  GradientBackgroundView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 23.01.2026.
//

import SwiftUI

struct GradientBackgroundView: View {
    let color: Color?
    private let defaultColor: Color = .clear
    
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .foregroundStyle(
                    LinearGradient(
                        colors: [color?.opacity(0.5) ?? defaultColor, .clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .ignoresSafeArea()
                .frame(height: proxy.size.height / 6, alignment: .bottom)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}
