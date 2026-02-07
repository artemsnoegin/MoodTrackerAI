//
//  SummaryChartView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI
import Charts

struct SummaryChartView: View {
    let summary: Summary
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text("You reported \(summary.daysWithReportCount) times")
                        .font(.headline)
                    
                    Text("Your average mood was \(summary.averageMoodScore.title)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom)
                
                Spacer()
                
                ProgressCircle(progress: summary.contribution,
                               color: summary.averageMoodScore.color)
            }
            
            chartContent()
        }
    }
    
    @ViewBuilder
    private func chartContent() -> some View {
        let colors = summary.uniqueScores.map(\.color)
        let dates = summary.reports.map(\.date)
        
        Chart(summary.actualReports) { report in
            if let value = report.score?.rawValue {
                
                LineMark(
                    x: .value("Date", report.date),
                    y: .value("Score", value)
                )
                .foregroundStyle(
                    LinearGradient(colors: colors,
                                   startPoint: .bottom,
                                   endPoint: .top)
                )
                .interpolationMethod(.cardinal)
                .symbol(.circle)
                
                AreaMark(
                    x: .value("Date", report.date),
                    y: .value("Score", value)
                )
                .foregroundStyle(
                    LinearGradient(colors: colors,
                                   startPoint: .bottom,
                                   endPoint: .top)
                    .opacity(0.2)
                )
                .interpolationMethod(.cardinal)
            }
        }
        .aspectRatio(2, contentMode: .fit)
        .chartXScale(range: .plotDimension(padding: 8))
        .chartXAxis {
            AxisMarks(position: .bottom, values: dates) {
                AxisGridLine()
                AxisValueLabel(format: .dateTime.day().weekday())
            }
        }
        .chartYScale(range: .plotDimension(padding: 8))
        .chartYScale(domain: -1...1)
        .chartYAxis {
            AxisMarks(position: .leading, values: [-1, -0.5, 0, 0.5, 1]) { value in
                AxisValueLabel {
                    switch value.as(Double.self) {
                    case -1: Text("bad")
                    case -0.5: Text("fair")
                    case 0: Text("okay")
                    case 0.5: Text("good")
                    default: Text("great")
                    }
                }
            }
        }
    }
    
}
