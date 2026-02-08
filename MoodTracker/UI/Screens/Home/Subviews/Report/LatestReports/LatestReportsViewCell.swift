//
//  LatestReportsViewCell.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 23.01.2026.
//

import SwiftUI

struct LatestReportsViewCell: View {
    let report: Report
    var isSelected: Bool
    
    @ScaledMetric(relativeTo: .subheadline)
    private var iconSize: CGFloat = 50
    
    private var scale: Double { isSelected ? 1.05 : 1 }
    
    var body: some View {
        VStack(spacing: 3) {
            Text(report.dateShort)
                .font(.subheadline)
            
            Image(report.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
            
            Text(report.subtitle)
                .font(.headline)
        }
        .padding()
        .glassEffect(.regular.tint(report.color.opacity(isSelected ? 0.9 : 0.2)).interactive(!isSelected),
                     in: RoundedRectangle(cornerRadius: 20))
        .scaleEffect(scale, anchor: .leading)
    }
}
