//
//  LoginView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 80) {
                Spacer()
                
                Image(colorScheme == .dark ? "instagram-logo 1" : "instagram-logo 2")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(spacing: 10) {
                    TextFieldView(inputText: $email, placeholder: "Email, username or mobile number")
                    
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
                    
                    Button("Log in") {
                        
                    }
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    
                    Button("Forgotten password?") {
                        
                    }
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(Color.blue.opacity(0.8))
                }
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        MobileNumberRegistrationView()
                    } label: {
                        Text("Create new account")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .overlay(
                                Capsule()
                                    .stroke(Color(.systemBlue), lineWidth: 1)
                            )
                            .padding()
                    }
                    
                    
                    HStack {
                        Image(colorScheme == .dark ? "instagram-logo 1" : "instagram-logo 2")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text("Meta")
                            .foregroundStyle(Color(.systemGray2))
                    }
                    .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    LoginView()
//        .preferredColorScheme(.dark)
}
