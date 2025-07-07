//
//  EmailRegistrationPasswordView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct EmailRegistrationPasswordView: View {
    
    @Binding var email: String
    @Environment(AuthManager.self) var authManager
    @Environment(\.dismiss) var dismiss
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var rememberInfo: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Create a password")
                            .font(.title)
                            .fontWeight(.regular)
                            
                        Text("Create a password with at least six letters or numbers. It should be something that others can't guess.")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    .padding(.horizontal)
                    .padding(.trailing)
                    
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecure {
                                SecureField("Password", text: $password)
                                    .padding(12)
                                    .frame(height: 60)
                                    .background(Color(.systemGray6))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .padding(.horizontal)
                            } else {
                                TextFieldView(inputText: $password, placeholder: "Password")
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            isSecure.toggle()
                        } label: {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundStyle(.secondary)
                                .padding(.trailing)
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Button {
                            rememberInfo.toggle()
                        } label: {
                            Image(systemName: rememberInfo ? "checkmark.square" : "square")
                        }
                        
                        Text("Remember login info.")
                        Text("Learn more")
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        Button("Next") {
                           signUp()
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                    }
                    .padding(.horizontal)
                }
                
                
                Spacer()
                
                Button("I already have an account") {
                    dismiss()
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.systemBlue))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(Color.primary)
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

private extension EmailRegistrationPasswordView {
    func signUp() {
        Task { await authManager.signUp(email: email, password: password) }
    }
}

#Preview {
    EmailRegistrationPasswordView(email: .constant(""))
        .environment(AuthManager())
}
