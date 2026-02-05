//
//  WeeklyInsightChart.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI
import Charts

struct WeeklyInsightChart: View {
    let insight: Insight
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                title()
                    .padding(.bottom)
                circle()
            }
            
            Chart(insight.reports) { report in
                if let score = report.score {
                    LineMark(
                        x: .value("Date", report.date),
                        y: .value("Score", score.rawValue)
                    )
                    .foregroundStyle(
                        LinearGradient(colors: insight.uniqueScores.map(\.color),
                                       startPoint: .bottom,
                                       endPoint: .top)
                    )
                    .interpolationMethod(.cardinal)
                    .symbol(.circle)
                    
                    AreaMark(
                        x: .value("Date", report.date),
                        y: .value("Score", score.rawValue)
                    )
                    .foregroundStyle(
                        LinearGradient(colors: insight.uniqueScores.map(\.color), startPoint: .bottom, endPoint: .top)
                            .opacity(0.2)
                    )
                    .interpolationMethod(.cardinal)
                }
            }
            .aspectRatio(2, contentMode: .fit)
            .chartXScale(range: .plotDimension(padding: 8))
            .chartXAxis {
                AxisMarks(position: .bottom, values: insight.reports.map(\.date)) {
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
        .padding()
        .glassEffect(.regular.tint(.controlForeground).interactive(), in: RoundedRectangle(cornerRadius: 25))
//        .background(.white, in: RoundedRectangle(cornerRadius: 25))
    }
    
    @ViewBuilder
    func circle() -> some View {
        Text("\(insight.contributionPercent)%")
            .foregroundStyle(.primary)
            .font(.caption).bold()
            .padding()
            .overlay {
                Circle()
                    .stroke(insight.averageMoodScore.color.opacity(0.1), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: 0.85)
                    .stroke(insight.averageMoodScore.color.opacity(0.5), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            }
    }
    
    @ViewBuilder
    func title() -> some View {
        VStack(alignment: .leading) {
            Text("In the last \(insight.daysCount) days\nyou reported \(insight.daysWithReportCount) times")
                .font(.headline)
                
            Divider()
                
            Text("Your average mood was \(insight.averageMoodScore.title)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
