//
//  CategoryViewModel.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-05-12.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category]
    
    init() {
        self.categories = []
        
        Task {
            await fetchCategories();
        }
    }
    
    func fetchCategories() async {
        do {
            let snapshot = try await Firestore.firestore().collection("categories").getDocuments()
            DispatchQueue.main.async {
                Task {
                    for document in snapshot.documents {
                        let category = try document.data(as: Category.self)
                        self.categories.append(category)
                    }
                    print(self.categories)
                }
            }
        } catch {
            print("Failed to fetch categories, \(error.localizedDescription)")
        }
    }
}
