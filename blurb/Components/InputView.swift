//
//  InputView.swift
//  blurb
//
//  Created by Steven Anthony Zanga on 2024-02-18.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    var isNewPassword: Bool = false

    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .frame(minWidth: 44, minHeight: 44)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if(isSecureField) {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .textContentType(isNewPassword ? .newPassword : .password)
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com", isNewPassword: true);
}
