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
        Text("\(self.language.hello)")
            .onTapGesture {
                Task {
                    print("hello 1:, \(languageViewModel.selectedLanguages)")
                    await languageViewModel.deleteLanguage(selectedLanguage: language, user: viewModel.currentUser!)
                    presentationMode.wrappedValue.dismiss()
                    await languageViewModel.fetchUserSelectedLanguages(user: viewModel.currentUser!)
                    print("hello 2:, \(languageViewModel.selectedLanguages)")
                }
            }
    }
}
