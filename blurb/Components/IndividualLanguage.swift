//
//  Language.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-23.
//

import SwiftUI

struct IndividualLanguage: View {
    @State private var isPressed = false
    @EnvironmentObject var languageViewModel: LanguageViewModel
    
    let id: String
    let name: String
    let hello: String
    var body: some View {
        VStack {
            HStack {
                Text(self.name)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                Text(self.hello)
                    .padding()
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            languageViewModel.wasLanguageSelected = true
            languageViewModel.addSelectedLanguagetoSelectedLanguages(selectedLanguage: Language(id: self.id, name: self.name, hello: self.hello))
        }
    }
}

#Preview {
    IndividualLanguage(id: NSUUID().uuidString ,name: "Japanese", hello: "こんにちは")
}
