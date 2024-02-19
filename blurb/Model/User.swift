//
//  User.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-19.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    // computed
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        } else {
            return ""
        }
    }
}


extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Erika Boccardi", email: "test@gmail.com")
}
