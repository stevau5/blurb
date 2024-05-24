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
            ZStack {
                Color.customCream
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "gear")
                                .padding()
                                .imageScale(.large)
                                .foregroundColor(.customDarkGreen)
                        }
                    }
                    Text("Hello \(viewModel.currentUser?.first_name ?? "")!")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal)
                        .foregroundColor(Color.black)
                        .fontWeight(.heavy)
                    Text("Click on a blurb below to get started")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding([.bottom], 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.black)
                    ForEach(languageViewModel.languages, id: \.self) { language in
                        IndividualLanguage(id: language.id, name: language.name, hello: language.hello, code: language.code)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
