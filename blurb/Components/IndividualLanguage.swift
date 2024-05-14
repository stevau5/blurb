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
    var code: String
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
            .background(colorMap())
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .contentShape(Rectangle())
            .onTapGesture {
                isNavigatingToLearn = true
            }
            .navigationDestination(isPresented: $isNavigatingToLearn) {
                LearnView(language: Language(id: self.id, name: self.name, hello: self.hello, code: self.code))
            }
        }
    }
    
    func colorMap() -> Color {
        if self.name == "Japanese" {
            return Color(red: 95.0 / 255.0, green: 93.0 / 255.0, blue: 156.0 / 255.0)
        } else if self.name == "French" {
            return Color(red: 97.0 / 255.0, green: 150.0 / 255.0, blue: 166.0 / 255.0)
        } else if self.name == "Italian" {
            return Color(red: 164.0 / 255.0, green: 206.0 / 255.0, blue: 149.0 / 255.0)
        } else {
            return Color(hue: 244.0 / 255.0, saturation: 237.0 / 255.0, brightness: 204.0 / 255.0)
        }
    }
}

#Preview {
    IndividualLanguage(id: NSUUID().uuidString ,name: "Japanese", hello: "こんにちは", code: "jp")
}
