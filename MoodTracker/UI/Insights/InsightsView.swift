//
//  InsightsView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 29.01.2026.
//

import SwiftUI

struct InsightsView: View {
    @ObservedObject var viewModel: InsightsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                InsightViewCell(title: "Summary") {
                    SummaryChartView(summary: viewModel.summary())
                }
                
                InsightViewCell(title: "Trends") {
                    TrendsView(trend: viewModel.trend())
                }
            }
        }
        .navigationTitle("Insights")
        .background(backgroundContent)
        .onAppear(perform: viewModel.loadReports)
    }
    
    @ViewBuilder
    private var backgroundContent: some View {
        LinearGradient(
            colors: [viewModel.averageMoodScore.color.opacity(0.5), .clear],
            startPoint: .top,
            endPoint: .center
        )
        .ignoresSafeArea()
    }
}



#Preview {
    let mock = MockRepository(type: .cynicalEN)
    let rs = ReportService(repository: mock)
    let vm = InsightsViewModel(reportService: rs)
    InsightsView(viewModel: vm)
}
