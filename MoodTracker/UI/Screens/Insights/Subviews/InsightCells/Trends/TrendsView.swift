//
//  TrendsView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 06.02.2026.
//

import SwiftUI

struct TrendsView: View {
    let trend: Trend
    
    var body: some View {
        VStack(alignment: .leading) {
            content(
                title: trend.averageTitle,
                description: trend.averageDescription,
                icon: trend.averageIcon,
                color: trend.avergageColor)
            
            Divider()
                .padding(.trailing)

            content(
                title: trend.stabilityTitle,
                description: trend.stabilityDescription,
                icon: trend.stabilityIcon,
                color: trend.stabilityColor)
            
            Divider()
                .padding(.trailing)

            content(
                title: trend.contributionTitle,
                description: trend.contributionDescription,
                icon: trend.contributionIcon,
                color: trend.contributionColor)
        }
        .padding(.top)
    }
    
    @ViewBuilder
    private func content(title: String,
                         description: String,
                         icon: String,
                         color: Color) -> some View {
        HStack {
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(title)
                .font(.headline)
            
            Image(systemName: icon)
                .foregroundStyle(color)
                .font(.headline)
                .bold()
        }
    }
}

#Preview {
    let rs = ReportService(repository:
        MockRepository(type: .analyticalEN)
    )
    let trend = Trend(comparing: rs.getLatestReports(count: 14, reversed: true))
    
    InsightViewCell(title: "Trends") {
        TrendsView(trend: trend)
    }
}
