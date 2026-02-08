//
//  EmotionScorePageView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.

import SwiftUI

struct EmotionScoreEditPageView: View {
    @EnvironmentObject var viewModel: EditReportViewModel
    
    var body: some View {
        VStack {
            Text("How are you today?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            ZStack {
                SphereView(color: viewModel.report.score?.color)
                if let score = viewModel.report.score {
                    Image(score.imageName)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .opacity(0.9)
                }
            }
            Spacer()
            
            EmotionScorePickerView(selection: $viewModel.report.score)
                .padding(.vertical)
            
            NavigationButton(title: "Continue", isHidden: !viewModel.isScorePickerPageComplete) {
                viewModel.go(to: .secondPage)
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(role: .close) {
                    viewModel.goBackToHomeView()
                }
            }
        }
    }
}

#Preview {
    let coordinator = Coordinator(
        repository: MockRepository(type: .analyticalEN)
    )
    NavigationStack {
        EmotionScoreEditPageView()
    }
    .environmentObject(coordinator.editReportViewModel)
}
