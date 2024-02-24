//
//  Language Selector.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-23.
//

import SwiftUI

struct LanguageSelector: View {
    var body: some View {
        IndividualLanguage(id: NSUUID().uuidString ,name: "Japanese", hello: "こんにちは")
        IndividualLanguage(id: NSUUID().uuidString ,name: "French", hello: "Bonjour")
        IndividualLanguage(id: NSUUID().uuidString ,name: "Italian", hello: "Ciao")
    }
}

#Preview {
    LanguageSelector()
}
