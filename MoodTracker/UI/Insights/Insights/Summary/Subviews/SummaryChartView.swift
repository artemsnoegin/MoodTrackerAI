//
//  SummaryChartView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 08.02.2026.
//

import SwiftUI
import Charts

struct SummaryChartView: View {
    let summary: Summary
    
    var body: some View {
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
