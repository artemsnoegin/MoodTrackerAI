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
    let repo = MockRepository(type: .burnoutRU)
    let rs = ReportService(repository: repo)
    let reports = rs.getLatestReports(count: 14)
    let trend = Trend(comparing: reports)
    TrendsView(trend: trend)
}
