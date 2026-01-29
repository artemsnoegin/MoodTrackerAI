//
//  EditReportView.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 19.01.2026.
//

import SwiftUI

struct EditReportView: View {
    let page: ReportEditPage
    
    var body: some View {
        switch page {
        case .firstPage: EmotionScoreEditPageView()
        case .secondPage: UserDescriptionEditPageView()
        case .thirdPage: ConfirmTransitionEditPageView()
        }
    }
}


