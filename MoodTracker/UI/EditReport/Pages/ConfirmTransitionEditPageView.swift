//
//  ConfirmTransitionPageView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.

import SwiftUI

struct ConfirmTransitionEditPageView: View {
    @EnvironmentObject var viewModel: EditReportViewModel
    
    @State private var isDrawn = false
    
    var body: some View {
        VStack {
            if isDrawn {
                Image(systemName: "checkmark")
                    .font(.system(size: 75))
                    .transition(.symbolEffect(.drawOn))
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            try? await Task.sleep(nanoseconds: 700_000_000)
            withAnimation {
                isDrawn = true
            }
            
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            withAnimation {
                viewModel.saveReport()
            }
        }
    }
}
