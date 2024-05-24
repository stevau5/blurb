//
//  CategoryItem.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-23.
//

import SwiftUI

struct CategoryItem: View {
    let phrase: Phrase
    let languageCode: String
    
    var body: some View {
        HStack {
            HStack {
                Text(phrase.defaultPhrase)
                    .padding()
                    .foregroundColor(Color.customDarkGreen)
                Spacer()
                Text(phrase.translations[languageCode]!)
                    .padding()
                    .foregroundColor(Color.customDarkGreen)
            }
            .fontWeight(.bold)
            
            .background(Color.customGreen)
            .frame(maxWidth: 380, maxHeight: 50)
            .cornerRadius(25.0)
            .padding(.horizontal, 16)
            
            
            Spacer()
        }
    }
}

//#Preview {
//    CategoryItem(phrase: <#Phrase#>)
//}
