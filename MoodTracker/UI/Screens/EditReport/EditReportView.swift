//
//  EditReportView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 19.01.2026.
//

import SwiftUI

struct EditReportView: View {
    let page: EditReportPage
    
    var body: some View {
        switch page {
        case .firstPage: EmotionScoreEditPageView()
        case .secondPage: UserDescriptionEditPageView()
        case .thirdPage: ConfirmTransitionEditPageView()
        }
    }
}

#Preview {
    let coordinator = Coordinator(
        repository: MockRepository(type: .analyticalEN)
    )
    NavigationStack {
        EditReportView(page: .firstPage)
    }
    .environmentObject(coordinator.editReportViewModel)
}


