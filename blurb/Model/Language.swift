//
//  Language.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-22.
//

import Foundation
import SwiftUI

struct Language: Identifiable, Codable {
    let id: String
    let name: String
    let hello: String
}


extension Language {
    static var MOCK_LANGUAGE = Language(id: NSUUID().uuidString, name: "Japanese", hello: "こんにちは");
}
