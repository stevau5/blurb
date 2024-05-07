//
//  Translation.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-05.
//

import Foundation
import SwiftUI

struct Translation: Codable, Identifiable, Hashable {
    let id: String
    let word: String
    let translation: String
}

