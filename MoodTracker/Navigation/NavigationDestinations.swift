//
//  NavigationDestinations.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 21.01.2026.
//

enum NavigationDestination: Hashable {
    case editReportView(_ page: EditReportPage = .firstPage)
    case calendar
    case insights
    case userSettings
}

enum EditReportPage {
    case firstPage, secondPage, thirdPage
}
