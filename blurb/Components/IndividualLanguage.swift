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
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isNavigatingToLearn = false
    
    let id: String
    let name: String
    let hello: String
    let isAppendable: Bool
    var body: some View {
        NavigationStack {
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
            .background(color)
            .cornerRadius(10)
            .padding()
            .contentShape(Rectangle())
            .onTapGesture {
                if(isAppendable) {
                    languageViewModel.wasLanguageSelected = true
                    Task {
                        await languageViewModel.addSelectedLanguagetoSelectedLanguages(selectedLanguage: Language(id: self.id, name: self.name, hello: self.hello), user: viewModel.currentUser!)
                    }
                } else {
                    isNavigatingToLearn = true
                }
            }
            .navigationDestination(isPresented: $isNavigatingToLearn) {
                Learn(language: Language(id: self.id, name: self.name, hello: self.hello))
            }
        }
    }
    
    let color: Color = {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }()
}

#Preview {
    IndividualLanguage(id: NSUUID().uuidString ,name: "Japanese", hello: "こんにちは", isAppendable: true)
}
