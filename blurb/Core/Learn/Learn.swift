//
//  Learn.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-03-05.
//

import SwiftUI

struct Learn: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var languageViewModel: LanguageViewModel
    @Environment(\.presentationMode) var presentationMode

    
    var language: Language
    var body: some View {
        VStack(spacing: 20) {
            Text("\(self.language.hello)")
                .padding(.vertical)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 10)
            ScrollView {
                ForEach(language.translations) { translation in
                    Word(word: translation.word, translation: translation.translation, index: translation.id)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    Learn(language: Language(id: "some", name: "French", hello: "Bonjour", translations: [Translation(id: "0", word: "Hello", translation: "Bonjour")]))
}
