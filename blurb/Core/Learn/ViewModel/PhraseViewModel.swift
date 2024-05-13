//
//  PhraseViewModel.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-12.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class PhraseViewModel: ObservableObject {
    @Published var phrases: [Phrase]
    
    init() {
        self.phrases = []
        
        
        Task {
            await fetchPhrases()
        }
    }
    
    func fetchPhrases() async {
        do {
            let snapshot = try await Firestore.firestore().collection("phrases").getDocuments()
            DispatchQueue.main.async {
                Task {
                    for document in snapshot.documents {
                        var phrase = try document.data(as: Phrase.self)
                        self.phrases.append(phrase)
                    }
                }
            }
        } catch {
            print("Failed to fetch phrases, \(error.localizedDescription)")
        }
    }
}
