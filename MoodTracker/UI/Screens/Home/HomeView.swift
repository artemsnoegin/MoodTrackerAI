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
            HStack {
                LatestReportsView(reports: viewModel.reports,
                                  selection: $viewModel.selectedReport) {
                    viewModel.showCalendar()
                }
            }
            SelectedReportView(report: viewModel.selectedReport)
            
            Spacer()
            
            NavigationButton(title: "Report") {
                viewModel.updateReport()
            }
        }
        .padding()
        .background(GradientBackgroundView(color: viewModel.selectedReport.color))
        .navigationTitle("Mood Journal")
        .toolbar {
            toolbarContent()
        }
        .task(viewModel.loadReports)
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem {
            Button {
                viewModel.showInsights()
            } label: {
                HStack {
                    Image(systemName: "sparkles")
                    Text("Insights")
                }
                .foregroundStyle(
                    LinearGradient(colors: [.indigo, .primary, .yellow], startPoint: .leading, endPoint: .bottomTrailing)
                )
            }
        }
        
        ToolbarSpacer()
        
        ToolbarItem {
            Button("", systemImage: "person.fill") {
                viewModel.showUserSettings()
            }
            .disabled(true)
        }
    }
}

#Preview {
    let coordinator = Coordinator(
        repository: MockRepository(type: .analyticalEN)
    )
    
    NavigationStack {
        HomeView(viewModel: coordinator.homeViewModel)
    }
}


