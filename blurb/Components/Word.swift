//
//  Word.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-05.
//

import SwiftUI
import AVFoundation

var counter = 0;

struct Word: View {
    let word: String;
    let translation: String;
    let code: String;
    let speechSynthesizer = AVSpeechSynthesizer()

    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.word)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .padding(.horizontal)
                Text(self.translation)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color(red: 224 / 255.0, green: 251 / 255.0, blue: 226 / 255.0))
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            speak(self.translation)
        }
    }
    
    func speak(_ word: String) {
        let speechUtterance = AVSpeechUtterance(string: word)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: languageCodeMap(code: self.code))
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

#Preview {
    Word(word: "Where is the washroom?", translation: "Ou sont les toilettes?", code: "ja")
}
