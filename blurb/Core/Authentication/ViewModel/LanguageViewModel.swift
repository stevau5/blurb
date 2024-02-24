//
//  LanguageViewModel.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class LanguageViewModel: ObservableObject {
    @Published var languages: [Language]
    @Published var selectedLanguages: [Language]
    @Published var wasLanguageSelected: Bool = false
    
    init() {
        self.languages = []
        self.selectedLanguages = []
        
        Task {
            await fetchLanguages()
            // add a fetch user languages endpoint ...

        }
    }
    
    func fetchLanguages() async {
        do {
            let snapshot = try await Firestore.firestore().collection("languages").getDocuments()
            DispatchQueue.main.async {
                for document in snapshot.documents {
                    do {
                        var language = try document.data(as: Language.self)
                        self.languages.append(language)
                    } catch {
                        print("Failed to fetch languages, \(error.localizedDescription)")
                    }
                }
            }
        } catch {
            print("Failed to fetch languages, \(error.localizedDescription)")
        }
    }
    
    func fetchUserSelectedLanguages() {
        
    }
    
    func addSelectedLanguagetoSelectedLanguages(selectedLanguage: Language) {
        self.selectedLanguages.append(selectedLanguage)
    }
}
