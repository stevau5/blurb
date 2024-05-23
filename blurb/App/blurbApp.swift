//
//  blurbApp.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-18.
//

import SwiftUI
import Firebase

@main
struct blurbApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var languageViewModel = LanguageViewModel()
    @StateObject var phraseViewModel = PhraseViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(languageViewModel)
                .environmentObject(categoryViewModel)
                .environmentObject(phraseViewModel)                
        }
    }
}
