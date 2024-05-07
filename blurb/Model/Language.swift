//
//  Language.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-22.
//

import Foundation
import SwiftUI

struct Language: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let hello: String
    var translations: [Translation] = []
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

func == (lhs: Language, rhs: Language) -> Bool {
    return lhs.id == rhs.id
}
