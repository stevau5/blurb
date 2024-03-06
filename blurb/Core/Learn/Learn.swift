//
//  Learn.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-03-05.
//

import SwiftUI

struct Learn: View {
    var language: Language
    var body: some View {
        Text("\(self.language.hello)")
    }
}
