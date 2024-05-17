//
//  Word.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-05.
//

import SwiftUI

var counter = 0;

struct Word: View {
    let word: String;
    let translation: String;
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.word)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .padding(.horizontal)
                Text(self.translation)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(colorMap())
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    func colorMap() -> Color {
        if counter == 0 {
            counter += 1
            return Color(red: 224 / 255.0, green: 251 / 255.0, blue: 226 / 255.0)
        } else if counter == 1 {
            counter += 1
            return Color(red: 191 / 255.0, green: 246 / 255.0, blue: 195 / 255.0)
        } else if counter == 2 {
            counter += 1
            return Color(red: 176 / 255.0, green: 235 / 255.0, blue: 180 / 255.0)
        } else if  counter == 3 {
            counter = 0
            return Color(red: 172 / 255.0, green: 225 / 255.0, blue: 175 / 255.0)
        } else {
            return Color.black
        }
    }
}

#Preview {
    Word(word: "Where is the washroom?", translation: "Ou sont les toilettes?")
}
