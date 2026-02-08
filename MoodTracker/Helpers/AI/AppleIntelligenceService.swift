//
//  AppleIntelligenceService.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 30.01.2026.
//
//
//import Foundation
//import FoundationModels
//
//class AppleIntelligenceService {
//    private let lm = SystemLanguageModel.default
//    private let session: LanguageModelSession
//    
//    private var description: String = ""
//    
//    var isAvailable: Bool { lm.isAvailable }
//    
//    init() {
//        let instructions =
//          """
//          You are a mood tracking assistant. Your job is to generate helpful insights based ONLY on the provided user mood reports and statistics.
//          
//          Answer in RUSSIAN.
//          
//          Rules:
//          - Do NOT diagnose medical or mental health conditions.
//          - Do NOT mention being an AI.
//          - Use cautious language ("may", "might", "seems").
//          - Avoid generic advice.
//          - Keep it supportive, clear, and practical.
//          - If data is missing, mention limitations.
//          - Do not invent facts not present in the input.
//          """
//        
//        self.session = LanguageModelSession(model: lm,
//                                            instructions: instructions)
//        checkModelAvailability()
//    }
//    
//    func recap(for reports: [Report]) async -> String {
//        
//        let promptData = String(data: try! JSONEncoder().encode(reports), encoding: .utf8)!
//        
//        do {
//            description = "Thinking . . ."
//            let prompt =
//                    """
//                    Write a weekly mood recap in 120–180 words.
//                    Using this reports data \(promptData).
//                    Answer in language used in data.
//                    
//                    Include:
//                    - 1 sentence summary
//                    - 2 key patterns
//                    - 1 best moment
//                    - 1 gentle suggestion
//                    
//                    Keep it warm but not cheesy.
//                    """
//            
//            let response = try await session.respond(to: prompt)
//            return response.content
//        } catch {
//            return error.localizedDescription
//        }
//    }
//    
//    private func checkModelAvailability() {
//        switch lm.availability {
//        case .available:
//            print("Foundation Models is available and ready to go!")
//            
//        case .unavailable(.deviceNotEligible):
//            print("The model is not available on this device.")
//            
//        case .unavailable(.appleIntelligenceNotEnabled):
//            print("Apple Intelligence is not enabled in Settings.")
//            
//        case .unavailable(.modelNotReady):
//            print("The model is not ready yet. Please try again later.")
//            
//        case .unavailable:
//            print("The model is unavailable for an unknown reason.")
//        }
//    }
//}
