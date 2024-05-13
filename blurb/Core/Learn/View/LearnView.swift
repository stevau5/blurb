//
//  Learn.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-03-05.
//

import SwiftUI

struct LearnView: View {
    @EnvironmentObject var phraseViewModel: PhraseViewModel
    @State private var toggleGreeting: Bool = false
    @State private var toggle: Bool = true
    var language: Language
    
    var body: some View {
        VStack() {
            Text("\(self.language.hello)")
                .padding(.vertical)
                .font(.system(size: 20, weight: .bold))
            
                List {
                    DisclosureGroup(
                        isExpanded: $toggle,
                        content: {
                            ForEach(phraseViewModel.phrases) { phrase in
                                Word(word: phrase.defaultPhrase, translation: phrase.translations[language.code]!)
                                    .padding(.horizontal, -25)
                            }
                        },
                        label: {
                            Text("Greetings")
                                .fontWeight(.bold)
                        }
                    )
                }
                .listStyle(PlainListStyle())
        }
    }
    
}

#Preview {
    LearnView(language: Language(id: "some", name: "French", hello: "Bonjour", code: "fr"))
        .environmentObject(PhraseViewModel())
}
