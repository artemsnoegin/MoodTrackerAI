//
//  Repository.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 23.01.2026.
//

import Foundation

protocol Repository {
    func save(_ report: Report)
    
    func fetchReports() -> [Report]
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>]) -> [Report]
    
    func fetchReports(filterBy predicate: Predicate<Report>) -> [Report]
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>],
                      filterBy predicate: Predicate<Report>) -> [Report]
        
    func delete(_ report: Report)
}
