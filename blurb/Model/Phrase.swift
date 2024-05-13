//
//  Phrase.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-07.
//

import Foundation
import SwiftUI

struct Phrase: Codable, Identifiable {
    let id: String
    let categoryId: String
    let defaultPhrase: String
    let translations: [String: String]
}
