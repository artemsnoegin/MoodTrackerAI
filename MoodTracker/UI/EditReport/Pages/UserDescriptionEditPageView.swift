//
//  UserDescriptionPageView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.
//

import SwiftUI

struct UserDescriptionEditPageView: View {
    @EnvironmentObject var viewModel: EditReportViewModel
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Text("What made you feel \(viewModel.report.title)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Say something ...", text: $viewModel.report.userDescription, axis: .vertical)
                .lineLimit(10)
                .padding()
                .background(.quinary, in: RoundedRectangle(cornerRadius: 25))
                .tint(.secondary)
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
            
            Spacer()
            
        }
        .padding()
        .safeAreaInset(edge: .bottom) {
            HStack {
                NavigationButton(title: "Done", isHidden: !viewModel.isDescriptionPageComplete) {
                    viewModel.go(to: .thirdPage)
                }
                .animation(.default, value: viewModel.isDescriptionPageComplete)
                
                if isFocused  {
                    Button {
                        withAnimation {
                            isFocused = false
                        }
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                            .padding()
                            .glassEffect(.clear.tint(.primary).interactive())
                            .foregroundStyle(.background)
                    }
                }
            }
            .padding()
        }
    }
}
