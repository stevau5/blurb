//
//  Language Selector.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-23.
//

import SwiftUI

struct LanguageSelector: View {
    @EnvironmentObject var languageViewModel: LanguageViewModel
    
    var body: some View {
        Spacer()
        Text("Select a language below to add it to your blurbs.")
            .font(.title2)
            .fontWeight(.light)
            .padding(.horizontal)
            .padding([.bottom], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        ForEach(languageViewModel.languages, id: \.self) { language in
            if !languageViewModel.selectedLanguages.contains(where: { $0.id == language.id }) {
                IndividualLanguage(id: language.id, name: language.name, hello: language.hello, code: language.code, isAppendable: true)
                    .frame(height: 100)
            }
        }
        Spacer()
    }
}

#Preview {
    LanguageSelector()
}
