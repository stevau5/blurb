//
//  Learn.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-03-05.
//

import SwiftUI

struct LearnView: View {
    @EnvironmentObject var phraseViewModel: PhraseViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @State private var toggleGreeting: Bool = false
    @State private var toggle: Bool = false
    
    var language: Language
    
    var body: some View {
        ZStack {
            Color.customCream
                .ignoresSafeArea()
            VStack {
                Text("\(self.language.hello)")
                    .padding(.vertical)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.customDarkGreen)
                
                ForEach(phraseViewModel.groupedPhrases.keys.sorted(), id: \.self) { categoryId in
                    CategoryList(category: phraseViewModel.groupedPhrases[categoryId] ?? [], categoryId: categoryId, language: language)
                }
                Spacer()
            }
        }
    }
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

#Preview {
    LearnView(language: Language(id: "some", name: "French", hello: "Bonjour", code: "fr"))
        .environmentObject(PhraseViewModel())
}
