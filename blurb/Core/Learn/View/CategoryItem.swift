//
//  CategoryItem.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-23.
//

import SwiftUI
import AVFoundation

struct CategoryItem: View {
    let phrase: Phrase
    let languageCode: String
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        HStack {
            HStack {
                Text(phrase.defaultPhrase)
                    .padding()
                    .foregroundColor(Color.customDarkGreen)
                Spacer()
                Text(phrase.translations[languageCode]!)
                    .padding()
                    .foregroundColor(Color.customDarkGreen)
            }
            .fontWeight(.bold)
            .background(Color.customGreen)
            .frame(maxWidth: 380, idealHeight: 100)
            .cornerRadius(25.0)
            .padding(.horizontal, 16)
            .onTapGesture {
                speak(phrase.translations[languageCode]!)
            }
            
            Spacer()
        }
    }
    
    func speak(_ word: String) {
        let speechUtterance = AVSpeechUtterance(string: word)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: languageCodeMap(code: self.languageCode))
        speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
        
        speechSynthesizer.speak(speechUtterance)
    }
    
    func languageCodeMap(code: String) -> String {
        switch code {
        case "en":
            return "en-US"
        case "fr":
            return "fr-CA"
        case "it":
            return "it-IT"
        case "jp":
            return "ja-JP"
        default:
            return "en-US"
        }
    }
}
