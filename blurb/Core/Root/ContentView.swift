//
//  ContentView.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-18.
//

import SwiftUI

extension Color {
    static let customYellow = Color(red: 243.0 / 255.0, green: 202.0 / 255.0, blue: 82.0 / 255.0)
    static let customBeige = Color(red: 246.0 / 255.0, green: 233.0 / 255.0, blue: 178.0 / 255.0)
    static let customDarkGreen = Color(red: 10.0 / 255.0, green: 104.0 / 255.0, blue: 71.0 / 255.0)
    static let customGreen = Color(red: 122.0 / 255.0, green: 186.0 / 255.0, blue: 120.0 / 255.0)
}
struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
