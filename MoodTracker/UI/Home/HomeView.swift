//
//  HomeView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 21.01.2026.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            LatestReportsView(reports: viewModel.reports,
                                  selection: $viewModel.selectedReport)
            
            SelectedReportView(report: viewModel.selectedReport)
            
            Spacer()
            
            NavigationButton(title: "Report") {
                viewModel.updateReport()
            }
        }
        .padding()
        .background(GradientBackgroundView(color: viewModel.selectedReport.color))
        .navigationTitle("Mood Journal")
        .task(viewModel.loadReports)
    }
}




