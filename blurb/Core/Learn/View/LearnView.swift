//
//  Learn.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-03-05.
//

import SwiftUI

struct LearnView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var languageViewModel: LanguageViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var toggleGreeting: Bool = false
    @State private var toggle: Bool = false
    var language: Language
    var body: some View {
        VStack(spacing: 20) {
            Text("\(self.language.hello)")
                .padding(.vertical)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            
                List {
                    DisclosureGroup(
                        isExpanded: $toggle,
                        content: {
//                            ForEach(language.translations) { translation in
//                                Word(word: translation.word, translation: translation.translation, index: translation.id)
//                            }
                        },
                        label: { Text("Greetings") }

                    )
                    DisclosureGroup(
                        isExpanded: $toggleGreeting,
                        content: {
//                            ForEach(language.translations) { translation in
//                                Word(word: translation.word, translation: translation.translation, index: translation.id)
//                            }
                        },
                        label: { Text("Greetings") }

                    )
                }
                .listStyle(PlainListStyle())
        }
    }
    
}

//#Preview {
//    LearnView(language: Language(id: "some", name: "French", hello: "Bonjour", translations: [Translation(id: "0", word: "Hello", translation: "Bonjour"), Translation(id: "0", word: "Hello", translation: "Bonjour"), Translation(id: "0", word: "Hello", translation: "Bonjour")]))
//}
