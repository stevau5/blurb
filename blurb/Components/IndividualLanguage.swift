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
                        .foregroundColor(Color.customGreen)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    Text(self.hello)
                        .padding()
                        .foregroundColor(Color.customYellow)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.customDarkGreen)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .contentShape(Rectangle())
            .onTapGesture {
                isNavigatingToLearn = true
                triggerHapticFeedback()
            }
            .navigationDestination(isPresented: $isNavigatingToLearn) {
                LearnView(language: Language(id: self.id, name: self.name, hello: self.hello, code: self.code))
            }
        }
        .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
    }
    
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

#Preview {
    IndividualLanguage(id: NSUUID().uuidString ,name: "Japanese", hello: "こんにちは", code: "jp")
}
