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
        VStack() {
            Text("\(self.language.hello)")
                .padding(.vertical)
                .font(.system(size: 20, weight: .bold))
            List {
                ForEach(phraseViewModel.groupedPhrases.keys.sorted(), id: \.self) { categoryId in
                    DisclosureGroup(
                        isExpanded: Binding<Bool>(
                            get: { phraseViewModel.toggleStates[categoryId] ?? false },
                            set: { phraseViewModel.toggleStates[categoryId] = $0 }
                        ),
                        content: {
                            ForEach(phraseViewModel.groupedPhrases[categoryId] ?? []) { phrase in
                                Word(word: phrase.defaultPhrase, translation: phrase.translations[language.code]!)
                                    .padding(.horizontal, -25)
                            }
                        },
                        label: {
                            Text(getCategoryName(id: categoryId))
                                .fontWeight(.bold)
                        }
                    )
                }
            }
            .listStyle(PlainListStyle())
        }
    }
    
    func getCategoryName(id: String) -> String {
        if let category = categoryViewModel.categories.first(where: { $0.id == id}) {
            return category.name
        } else {
            return "Invalid Category Name"
        }
    }
}

#Preview {
    LearnView(language: Language(id: "some", name: "French", hello: "Bonjour", code: "fr"))
        .environmentObject(PhraseViewModel())
}
