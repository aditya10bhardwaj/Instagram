//
//  TextFieldView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var inputText: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $inputText)
            .foregroundStyle(.secondary)
            .padding(12)
            .frame(height: 60)
            .background(Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.systemGray), lineWidth: 1)
            )
            .autocorrectionDisabled()
            .padding(.horizontal)
    }
}

#Preview {
    TextFieldView(inputText: .constant(""), placeholder: "Email, username or mobile number")
}
