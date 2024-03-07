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
        ForEach(languageViewModel.languages, id: \.self) { language in
            if !languageViewModel.selectedLanguages.contains(where: { $0.id == language.id }) {
                IndividualLanguage(id: language.id, name: language.name, hello: language.hello, isAppendable: true)
            }
        }
    }
}

#Preview {
    LanguageSelector()
}
