//
//  CalendarPageView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 05.02.2026.
//

import SwiftUI

struct CalendarPageView: View {
    let labels: [String]
    let month: Date
    let reports: [Report]
    @Binding var selection: Report?
    
    private let columns = Array(
        repeating: GridItem(.flexible(),spacing: 0),
        count: 7
    )
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            labelsContent()
            
            mainContent()
            
            placeholderContent()
        }
        .font(.headline)
        .padding(.trailing)
        .id(reports)
        .transition(.opacity.animation(.snappy))
    }
    
    @ViewBuilder
    private func labelsContent() -> some View {
        ForEach(labels, id: \.self) { label in
            Text(label)
                .foregroundStyle(.primary)
                .padding(.vertical)
        }
    }
    
    @ViewBuilder
    private func mainContent() -> some View {
        ForEach(reports) { report in
            ZStack {
                if report == selection {
                    Circle()
                        .foregroundStyle(report.score?.color ?? .gray)
                        .opacity(0.3)
                        .transition(.scale.animation(.bouncy))
                }
                
                Text(report.date, format: .dateTime.day())
                    .foregroundStyle(colorFor(report))
                    .padding(.vertical)
                    .id(selection)
                    .onTapGesture {
                        withAnimation {
                            if selection == report {
                                selection = nil
                            } else {
                                selection = report
                            }
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    private func placeholderContent() -> some View {
        let missing = Array(repeating: ".", count: 42 - reports.count)
        
        ForEach(missing.enumerated(), id: \.offset) { label in
            Text(label.element)
                .fontWeight(.heavy)
                .foregroundStyle(.quaternary)
                .padding(.vertical)
        }
    }
    
    private func colorFor(_ report: Report) -> any ShapeStyle {
        let isThisMonth = Calendar.current.isDate(report.date, equalTo: month, toGranularity: .month)
        let isSelected = report == selection
        let opacity = isSelected ? 1 : isThisMonth ? 1 : 0.3
        
        if let color = report.score?.color {
            return color.opacity(opacity)
        } else {
            return .gray.opacity(opacity)
        }
    }
}
