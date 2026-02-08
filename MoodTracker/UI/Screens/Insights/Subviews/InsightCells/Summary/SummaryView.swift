//
//  SummaryView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI

struct SummaryView: View {
    let summary: Summary
    
    var body: some View {
        VStack {
            header()
            
            SummaryChartView(summary: summary)
        }
    }
    
    @ViewBuilder
    private func header() -> some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                Text("You reported \(summary.contributionCount) times")
                    .font(.headline)
                
                Text("Your average mood was \(summary.averageMoodScore.title)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom)
            
            Spacer()
            
            ProgressCircle(progress: summary.contributionValue,
                           color: summary.averageMoodScore.color)
        }
    }
}

#Preview {
    let rs = ReportService(
        repository: MockRepository(type: .analyticalEN)
    )
    let summary = Summary(reports: rs.getLatestReports())
    
    InsightViewCell(title: "Summary") {
        SummaryView(summary: summary)
    }
}
