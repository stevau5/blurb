//
//  AuthViewModel.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-19.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    // lets me know if user is logged in
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password);
            DispatchQueue.main.async {
                self.userSession = result.user
            }
            await fetchUser()
        } catch {
            print("Login Error, \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            DispatchQueue.main.async {
                self.userSession = result.user
            }
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Failed to create user, \(error.localizedDescription)")
        }
    }
    
    func signOut () {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to sign user out, \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            print(uid)
            try await Firestore.firestore().collection("users").document(uid).delete()
            signOut()
        } catch {
            print("Failed to delete user, \(error.localizedDescription)")
        }
    }
    
    func fetchUser () async {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: User.self)
            
            print("Current User is: \(String(describing: self.currentUser))")
        } catch {
            print("Failed to fetch user, \(error.localizedDescription)")
        }
    }
}
