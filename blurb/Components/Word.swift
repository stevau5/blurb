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
    let index: String;
    
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
            .padding(.vertical)
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
            return Color(red: 205.0 / 255.0, green: 232.0 / 255.0, blue: 229.0 / 255.0)
        } else if counter == 1 {
            counter += 1
            return Color(red: 239.0 / 255.0, green: 247.0 / 255.0, blue: 255.0 / 255.0)
        } else if counter == 2 {
            counter += 1
            return Color(red: 122.0 / 255.0, green: 178.0 / 255.0, blue: 178.0 / 255.0)
        } else if  counter == 3 {
            counter = 0
            return Color(red: 77.0 / 255.0, green: 134.0 / 255.0, blue: 156.0 / 255.0)
        } else {
            return Color.black
        }
    }
}

#Preview {
    Word(word: "Where is the washroom?", translation: "Ou sont les toilettes?", index: "2")
}
