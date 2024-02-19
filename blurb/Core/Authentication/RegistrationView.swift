//
//  RegistrationView.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-18.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = "";
    @State private var password = "";
    @State private var passwordConfirmation = "";
    @State private var fullName = "";
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .padding(.vertical, 32);
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "Enter your email")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                InputView(text: $fullName, title: "Full name", placeholder: "Enter your name")
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                InputView(text: $passwordConfirmation, title: "Confirm password", placeholder: "Confirm your password", isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                print("Sign user up")
            } label: {
                HStack() {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label : {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .font(.system(size: 14))
            }
        }
        
    }
}

#Preview {
    RegistrationView()
}
