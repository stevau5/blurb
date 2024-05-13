//
//  Phrase.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-07.
//

import Foundation
import SwiftUI

struct Phrase: Codable {
    let id: String
    let categoryId: String
    let defaultPhrase: String
    let translations: [String: String]
    var category: Category?
}
