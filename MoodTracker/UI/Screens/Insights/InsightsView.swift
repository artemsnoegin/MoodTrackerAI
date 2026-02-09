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
                    SummaryView(summary: viewModel.summary())
                }
                
                InsightViewCell(title: "Trends") {
                    TrendsView(trend: viewModel.trend())
                }
                
                InsightViewCell(title: "Word Cloud") {
                    WordCloudView(cloud: viewModel.wordCloud())
                }
            }
        }
        .navigationTitle("Insights")
        .background(backgroundContent)
        .scrollIndicators(.hidden)
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
    let coordinator = Coordinator(
        repository: MockRepository(type: .analyticalEN)
    )
    
    NavigationStack {
        InsightsView(viewModel: coordinator.insightsViewModel)
    }
}
