//
//  Category.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-23.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject var phraseViewModel: PhraseViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    @State private var chevronToggle: Bool = false
    let category: [Phrase]
    let categoryId: String
    let language: Language
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(getCategoryName(id: categoryId))
                    .foregroundColor(Color.customGreen)
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(chevronToggle ? 0 : 180))
                    .animation(.easeInOut, value: chevronToggle)
                    .foregroundColor(Color.customYellow)
                    .padding(.horizontal)
            }
            .onTapGesture {
                withAnimation {
                    self.chevronToggle.toggle()
                    triggerHapticFeedback()
                }
            }
            Spacer()
        }
        .foregroundColor(Color.customGreen)
        .fontWeight(.bold)
        .font(.title2)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.customDarkGreen)
        .cornerRadius(25.0)
        .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
        .padding(.horizontal)
    
        if chevronToggle {
            VStack() {
                ForEach(category, id: \.self) { phrase in
                    CategoryItem(phrase: phrase, languageCode: language.code)
                }
            }
        }
    }
    
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    func getCategoryName(id: String) -> String {
        if let category = categoryViewModel.categories.first(where: { $0.id == id}) {
            return category.name
        } else {
            return "Invalid Category Name"
        }
    }
}
