//
//  SwiftDataRepository.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 23.01.2026.
//

import SwiftData
import Foundation

@MainActor
class SwiftDataRepository: Repository {
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: Report.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            debugPrint("Error initializing database container:",
                       error.localizedDescription)
        }
    }
    
    func save(_ report: Report) {
        guard let container = container else {
            debugPrint("Error accessing database container")
            return
        }
        
        container.mainContext.insert(report)
        
        do {
            try container.mainContext.save()
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func delete(_ report: Report) {
        guard let container = container else {
            debugPrint("Error accessing database container")
            return
        }
        
        container.mainContext.delete(report)
        
        do {
            try container.mainContext.save()
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func fetchReports() -> [Report] {
        let fetchDescriptor = FetchDescriptor<Report>()
        
        return fetchReports(descriptor: fetchDescriptor)
    }
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>]) -> [Report] {
        var fetchDescriptor = FetchDescriptor<Report>()
        fetchDescriptor.sortBy = descriptors

        return fetchReports(descriptor: fetchDescriptor)
    }
    
    func fetchReports(filterBy predicate: Predicate<Report>) -> [Report] {
        var fetchDescriptor = FetchDescriptor<Report>()
        fetchDescriptor.predicate = predicate
        
        return fetchReports(descriptor: fetchDescriptor)
    }
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>],
                      filterBy predicate: Predicate<Report>) -> [Report] {
        var fetchDescriptor = FetchDescriptor<Report>()
        fetchDescriptor.sortBy = descriptors
        fetchDescriptor.predicate = predicate
            
        return fetchReports(descriptor: fetchDescriptor)
    }
    
    private func fetchReports(descriptor: FetchDescriptor<Report>) -> [Report] {
        guard let container = container else {
            debugPrint("Error accessing database container")
            return []
        }
        
        do {
            return try container.mainContext.fetch(descriptor)
        }
        catch {
            debugPrint(error.localizedDescription)
            return []
        }
    }
}
