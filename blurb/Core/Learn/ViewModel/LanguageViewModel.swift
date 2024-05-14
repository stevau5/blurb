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
    
    init() {
        self.languages = []
        
        Task {
            await fetchLanguages()
        }
    }
    
    func fetchLanguages() async {
        do {
            let snapshot = try await Firestore.firestore().collection("languages").getDocuments()
            DispatchQueue.main.async {
                Task {
                    for document in snapshot.documents {
                        let language = try document.data(as: Language.self)
                        self.languages.append(language)
                    }
                }
            }
        } catch {
            print("Failed to fetch languages, \(error.localizedDescription)")
        }
    }
}
