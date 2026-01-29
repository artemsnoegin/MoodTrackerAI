//
//  NavigationButton.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 20.01.2026.
//

import SwiftUI

struct NavigationButton: View {
    var title: String
    var isHidden: Bool = false
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.controlForeground)
                .glassEffect(.regular.tint(.controlBackground).interactive(!isHidden))
                .opacity(isHidden ? 0 : 1)
        }
        .disabled(isHidden)
    }
}
