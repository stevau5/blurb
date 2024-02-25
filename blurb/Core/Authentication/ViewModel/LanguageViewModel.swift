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
    private var languageIds: [String] = []
    
    init() {
        self.languages = []
        self.selectedLanguages = []
        
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
                        do {
                            let language = try document.data(as: Language.self)
                            Task {
                                self.languages.append(language)
                            }
                        } catch {
                            print("Failed to fetch languages, \(error.localizedDescription)")
                        }
                    }
                }
            }
        } catch {
            print("Failed to fetch languages, \(error.localizedDescription)")
        }
    }
    
    func fetchUserSelectedLanguages(user: User) async {
        do {
            self.selectedLanguages = []
            let snapshot = try await Firestore.firestore().collection("userLanguages")
                .whereField("userId", isEqualTo: user.id)
                .getDocuments()
            print(snapshot)
            DispatchQueue.main.async {
                Task {
                    // GET THE LANGUAGE IDS FROM THE USERS SELECTED LANGUAGES
                    
                    for document in snapshot.documents {
                        do {
                            let userLanguage = try document.data(as: UserLanguage.self)
                            self.languageIds.append(userLanguage.languageId)
                            print("CONSOLE LOG: LANGUAGEIDS:::, \(self.languageIds)")
                        } catch {
                            print("Failed to fetch selected language \(error.localizedDescription)")
                        }
                    }
                    
                    // GET THE LANGUAGE FROM THE LANGUAGE IDS
                
                    let languagesSnapshot = try await Firestore.firestore().collection("languages")
                        .whereField("id", in: self.languageIds)
                        .getDocuments()
                    for document in languagesSnapshot.documents {
                        do {
                            let selectedLanguage = try document.data(as: Language.self)
                            self.selectedLanguages.append(selectedLanguage)
                            print("selectedLanguages, \(self.selectedLanguages)")
                        } catch {
                            print("Failed to fetch selected language \(error.localizedDescription)")
                        }
                    }
                }
            }
        } catch {
            print("Failed to fetch user languages, \(error.localizedDescription)")
        }
    }
    
    func addSelectedLanguagetoSelectedLanguages(selectedLanguage: Language, user: User) async {
        do {
            let userLanguage = UserLanguage(id: NSUUID().uuidString, userId: user.id, languageId: selectedLanguage.id);
            let encodedUserLanguage = try Firestore.Encoder().encode(userLanguage)
            try await Firestore.firestore().collection("userLanguages").addDocument(data: encodedUserLanguage)
            print("here")
            await fetchUserSelectedLanguages(user: user)
        } catch {
            print("Failed to add language to selected languages, \(error.localizedDescription)")
        }
    }
}
