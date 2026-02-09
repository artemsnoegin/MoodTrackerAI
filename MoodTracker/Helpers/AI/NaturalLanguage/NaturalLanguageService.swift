//
//  NaturalLanguageService.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 29.01.2026.

import NaturalLanguage

class NaturalLanguageService {
    var included: Set<NLTag> = [
        .noun,
        .verb,
        .adjective
    ]
    
    func language(of text: String) -> NLLanguage? {
        let languageRecognizer = NLLanguageRecognizer()
        languageRecognizer.processString(text)
        
        return languageRecognizer.dominantLanguage
    }
    
    func retrieveTokens(from text: String,
                        using dictionary: [String: SentimentToken]) -> [SentimentToken] {
        
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = text
        
        var tokens: Set<SentimentToken> = []
        
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex,
                             unit: .word,
                             scheme: .lexicalClass,
                             options: options) { tag, range -> Bool in
            guard let tag = tag,
                  included.contains(tag)
            else { return true }
            
            let token = String(text[range]).lowercased()
            if let token = Rusentilex.dictionary[token] {
                tokens.insert(token)
            }
            
            return true
        }
        
        return Array(tokens)
    }
    
    func retrieveTokens(from text: String,
                        lemmatizing: Bool = true) -> [SentimentToken] {
        
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        var string = text
        
        if lemmatizing {
            string = lemmatize(text: text).joined(separator: " ")
        }
        
        tagger.string = string
        
        var tokens: Set<SentimentToken> = []
        
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.enumerateTags(in: string.startIndex..<string.endIndex,
                             unit: .word,
                             scheme: .lexicalClass,
                             options: options) { tag, range -> Bool in
            guard let tag = tag,
                  included.contains(tag)
            else { return true }
            
            let token = String(string[range]).lowercased()
            
            tokens.insert(SentimentToken(word: token,
                                         polarity: "unknown",
                                         score: 0,
                                         source: nil))
            return true
        }
        
        return Array(tokens)
    }
    
    func lemmatize(text: String) -> [String] {
        let tagger = NLTagger(tagSchemes: [.lemma])
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        var lemmas: [String] = []
        
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex,
                             unit: .word,
                             scheme: .lemma,
                             options: options) { tag, range -> Bool in
            
            if let lemma = tag?.rawValue {
                lemmas.append(lemma)
            } else {
                let token = String(text[range])
                lemmas.append(token)
            }
            
            return true
        }
        
        return lemmas
    }
}
