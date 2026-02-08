//
//  CalendarView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 03.02.2026.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: CalendarViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                CalendarPageView(month: viewModel.today,
                                 reports: viewModel.reports,
                                 selection: $viewModel.selection)
                
                if let selectedReport = viewModel.selection {
                    SelectedReportView(report: selectedReport)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.today.formatted(.dateTime.month(.wide).year()))
        .toolbar(content: toolbarContent)
        .background(backgroundContent)
    }
    
    @ViewBuilder
    private func toolbarContent() -> some View {
        Group {
            Button("", systemImage: "chevron.backward") {
                withAnimation {
                    viewModel.previousMonth()
                }
            }
            
            Button("", systemImage: "chevron.forward") {
                withAnimation {
                    viewModel.nextMonth()
                }
            }
            .disabled(!viewModel.canGoForward)
        }
        .font(.title2)
    }
    
    @ViewBuilder
    private var backgroundContent: some View {
        let color = viewModel.selection?.color ?? .gray
        
        GeometryReader { proxy in
            HStack {
                Spacer()
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [color.opacity(0.3), .clear],
                            startPoint: .top,
                            endPoint: .init(x: 1, y: 0.8))
                    )
                    .frame(maxWidth: proxy.size.width / 3)
            }
        }
    }
}

#Preview {
    let coordinator = Coordinator()
    NavigationStack {
        CalendarView(viewModel: coordinator.calendarViewModel)
    }
}


