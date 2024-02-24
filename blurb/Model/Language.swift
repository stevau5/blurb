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
}

func == (lhs: Language, rhs: Language) -> Bool {
    return lhs.id == rhs.id
}

extension Language {
    static var MOCK_LANGUAGE = Language(id: NSUUID().uuidString, name: "Japanese", hello: "こんにちは");
}
