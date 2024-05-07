//
//  LanguageList.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-04-29.
//
import Foundation
import SwiftUI

struct Languages: Identifiable, Codable, Hashable {
    let id: Int
    let languageId: String
    let hello: String
}
