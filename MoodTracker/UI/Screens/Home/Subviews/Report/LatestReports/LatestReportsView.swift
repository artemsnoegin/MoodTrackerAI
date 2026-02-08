//
//  LatestReportsView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 22.01.2026.
//

import SwiftUI

struct LatestReportsView: View {
    let reports: [Report]
    @Binding var selection: Report
    let calendarAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latest reports")
                .font(.title2)
                .fontWeight(.semibold)
            
            GlassEffectContainer {
                ScrollView(.horizontal) {
                    HStack {
                        reportsList()
                                
                        calendarButton()
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    @ViewBuilder
    private func reportsList() -> some View {
        ForEach(reports) { report in
            LatestReportsViewCell(report: report,
                                  isSelected: selection == report)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    selection = report
                }
            }
        }
    }
    
    @ViewBuilder
    private func calendarButton() -> some View {
        Button {
            calendarAction()
        } label: {
            VStack(spacing: 8) {
                Text("All")
                    .font(.subheadline)
                Image(systemName: "calendar")
                    .font(.system(size: 25))
            }
            .tint(.primary)
            .padding()
            .glassEffect(.regular.interactive(),
                         in: RoundedRectangle(cornerRadius: 20))
        }
    }
}
