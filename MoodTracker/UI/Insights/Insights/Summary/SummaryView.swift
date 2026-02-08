//
//  SummaryView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI
import Charts

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
    
    @ViewBuilder
    private func chartContent() -> some View {
        Chart(summary.chartPoints, id: \.date) { date, score in
                LineMark(
                    x: .value("Date", date),
                    y: .value("Score", score.rawValue)
                )
                .foregroundStyle(
                    LinearGradient(colors: summary.colors,
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .interpolationMethod(.cardinal)
                .symbol(.circle)
                
                AreaMark(
                    x: .value("Date", date),
                    y: .value("Score", score.rawValue)
                )
                .foregroundStyle(
                    LinearGradient(colors: summary.colors,
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .opacity(0.2)
                )
                .interpolationMethod(.cardinal)
        }
        .aspectRatio(2, contentMode: .fit)
        .chartXScale(range: .plotDimension(padding: 8))
        .chartXAxis {
            AxisMarks(position: .bottom, values: summary.dates) {
                AxisGridLine()
                AxisValueLabel(format: .dateTime.day().weekday())
            }
        }
        .chartYScale(range: .plotDimension(padding: 12))
        .chartYScale(domain: -1...1)
        .chartYAxis {
            AxisMarks(position: .leading, values: summary.scoreValues) { value in
                AxisValueLabel(summary.scoreLabels[value.index])
            }
        }
    }
}

#Preview {
    let repo = MockRepository(type: .burnoutRU)
    let rs = ReportService(repository: repo)
    let reports = rs.getLatestReports(count: 7, reversed: true)
    let summary = Summary(reports: reports)
    InsightViewCell(title: "Summary") {
        SummaryView(summary: summary)
    }
    .background(summary.averageMoodScore.color.gradient.opacity(0.3))
}
