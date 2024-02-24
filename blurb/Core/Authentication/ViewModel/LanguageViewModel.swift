//
//  LanguageViewModel.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-23.
//

import Foundation

class LanguageViewModel: ObservableObject {
    @Published var Languages: [Language]
    @Published var selectedLanguages: [Language]
    @Published var wasLanguageSelected: Bool = false
    
    init() {
        // replace with a fetch Languages endpoint...
        self.Languages = [
            Language(id: NSUUID().uuidString, name: "Japanese", hello: "こんにちは"),
            Language(id: NSUUID().uuidString, name: "French", hello: "Bonjour"),
            Language(id: NSUUID().uuidString, name: "Italian", hello: "Ciao"),
        ]
        
        // replace with fetch user languages endpoint ...
        self.selectedLanguages = []
    }
    
    func fetchLanguages() {
        
    }
    
    func fetchUserSelectedLanguages() {
        
    }
    
    func addSelectedLanguagetoSelectedLanguages(selectedLanguage: Language) {
        self.selectedLanguages.append(selectedLanguage)
    }
    
}
