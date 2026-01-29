//
//  NavigationDestinations.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 21.01.2026.
//

enum NavigationDestination: Hashable {
    case editReportView(_ page: ReportEditPage = .firstPage)
}

enum ReportEditPage {
    case firstPage, secondPage, thirdPage
}
