//
//  NaturalLanguageService.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 29.01.2026.
//
//
//import NaturalLanguage
//
//class NaturalLanguageService {
//    
//    func retrieveTokens(from text: String) -> Dictionary<String, Int> {
//        let tagger = NLTagger(tagSchemes: [.nameTypeOrLexicalClass, .lemma])
//        tagger.string = text
//        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
//        
//        var result: [String: Int] = [:]
//        
//        let isIncluded: (NLTag) -> Bool = { tag in
//            tag == .noun ||
//            tag == .adjective ||
//            tag == .verb ||
//            tag == .idiom ||
//            tag == .pronoun ||
//            tag == .personalName ||
//            tag == .organizationName ||
//            tag == .placeName
//        }
//        
//        tagger.enumerateTags(in: text.startIndex..<text.endIndex,
//                             unit: .word,
//                             scheme: .nameTypeOrLexicalClass,
//                             options: options) { tag, range -> Bool in
//            guard let tag = tag,
//                  isIncluded(tag)
//            else { return true }
//            
//            if let lemma = tagger.tag(at: range.lowerBound, unit: .word, scheme: .lemma).0 {
//                if let value = result[lemma.rawValue] {
//                    result[lemma.rawValue] = value + 1
//                } else {
//                    result[lemma.rawValue] = 1
//                }
//            } else {
//                let key = String(text[range])
//                
//                if let value = result[key] {
//                    result[key] = value + 1
//                } else {
//                    result[key] = 1
//                }
//            }
//            
//            return true
//        }
//        
//        return result
//    }
//}
