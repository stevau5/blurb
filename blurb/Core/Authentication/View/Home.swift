//
//  Home.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-22.
//

import SwiftUI

struct Home: View {
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
            Spacer()
            if(languageViewModel.selectedLanguages != []) {
                ForEach(languageViewModel.selectedLanguages, id: \.self) { language in
                    IndividualLanguage(id: language.id, name: language.name, hello: language.hello, isAppendable: false)
                }
            } else {
                Text("You don't have any Language cards")
                    .padding(.vertical, 10)
                Text("Click the + button below to add one!")
            }
            Spacer()
            AddLanguageCard()
        }
        
        
    }
}

#Preview {
    Home()
}
