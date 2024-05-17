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
    @Published var groupedPhrases: [String: [Phrase]] = [:]
    @Published var toggleStates: [String: Bool] = [:]
    
    init() {
        self.phrases = []
        self.groupedPhrases = [:]
        
        Task {
            await fetchPhrases()
        }
    }
    
    func fetchPhrases() async {
        do {
            let snapshot = try await Firestore.firestore().collection("phrases").order(by: "categoryId").getDocuments()
            DispatchQueue.main.async {
                do {
                    for document in snapshot.documents {
                        let phrase = try document.data(as: Phrase.self)
                        self.phrases.append(phrase)
                    }
                } catch {
                    print("Error decoding phrase: \(error.localizedDescription)")
                }
            }
            updateGroupedPhrases()
        } catch {
            print("Failed to fetch phrases, \(error.localizedDescription)")
        }
    }
    
    func updateGroupedPhrases() {
        DispatchQueue.main.async {
            self.groupedPhrases = Dictionary(grouping: self.phrases, by: { $0.categoryId })
        }
        self.initializeToggleStates()
    }
    
    func initializeToggleStates() {
        for categoryId in self.groupedPhrases.keys {
            toggleStates[categoryId] = false
        }
    }
}
