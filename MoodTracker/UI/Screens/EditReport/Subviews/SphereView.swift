//
//  SphereView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 19.01.2026.
//

import SwiftUI

struct SphereView: View {
    var color: Color?
    
    @State private var scale: Double = 1
    @State private var shadowRadius: Double = 5
    @State private var animatedColor: Color = .clear
    
    var body: some View {
        VStack {
            Circle()
                .frame(minWidth: 150, idealWidth: 200, maxWidth: 250)
                .foregroundStyle(color ?? animatedColor)
                .shadow(color: color ?? animatedColor, radius: 50)
                .blur(radius: 25)
                .opacity(0.9)
                .scaleEffect(scale)
                .onAppear(perform: animateCircle)
        }
    }
    
    private func animateCircle() {
        withAnimation(.easeInOut(duration: 4).repeatForever()) {
            scale = 0.85
        }
        
        guard color == nil else { return }
        
        let initialColors: [Color] = Score.allCases.map { $0.color }
        
        if let randomColor = initialColors.randomElement() {
            withAnimation(.easeInOut(duration: 1).delay(0.5)) {
                animatedColor = randomColor
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 2)) {
                let index = Int.random(in: 0..<initialColors.count)
                animatedColor = initialColors[index]
            }
        }
    }
}
