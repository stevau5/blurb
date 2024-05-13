//
//  Home.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel;
    @EnvironmentObject var languageViewModel: LanguageViewModel;
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "gear")
                            .padding()
                            .imageScale(.large)
                            .foregroundColor(Color(.systemGray))
                    }
                }
            }
            Text("Hello \(viewModel.currentUser?.first_name ?? "")!")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            if(!languageViewModel.selectedLanguages.isEmpty) {
                Text("Click on a blurb below to get started")
                    .font(.headline)
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .padding([.bottom], 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(languageViewModel.selectedLanguages, id: \.self) { language in
                    IndividualLanguage(id: language.id, name: language.name, hello: language.hello, code: language.code, isAppendable: false)
                }
            } else {
                Text("You don't have any blurbs")
                    .padding(.vertical, 10)
                Text("Click the + button below to add one!")
            }
            Spacer()
            if languageViewModel.selectedLanguages.count != languageViewModel.languages.count {
                AddLanguageCard()
            }
        }
        .onReceive(viewModel.$currentUser) { currentUser in
            if let user = currentUser {
                Task {
                    await languageViewModel.fetchUserSelectedLanguages(user: user)
                }
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
