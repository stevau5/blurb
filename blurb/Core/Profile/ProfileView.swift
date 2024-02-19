//
//  ProfileView.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-19.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(User.MOCK_USER.fullname)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General") {
                HStack {
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    Spacer()
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account") {
                Button {
                    print("sign out")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                }
                
                Button {
                    print("Delete account")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete accout", tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
