//
//  SelectedReportView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 22.01.2026.
//

import SwiftUI

struct SelectedReportView: View {
    let report: Report
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text(report.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(strategy: .writingDirectionBased)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(report.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .offset(y: -20)
                    .rotationEffect(.degrees(15))
                    .padding(.trailing, 30)
            }
            .padding(.top, 30)
            .padding(.bottom)
            
            Text(report.description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
