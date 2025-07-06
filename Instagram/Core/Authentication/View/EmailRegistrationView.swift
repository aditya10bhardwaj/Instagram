//
//  EmailRegistratiovView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct EmailRegistrationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("What's your Email Address?")
                            .font(.title)
                            .fontWeight(.regular)
                            
                        Text("Enter the email address at which you can be contacted. No one will see this on your profile.")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    .padding(.horizontal)
                    .padding(.trailing)
                    
                    TextFieldView(inputText: $email, placeholder: "Email address")
                        .padding(.vertical)
                    
                    VStack(spacing: 12) {
                        Button("Next") {
                            
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Sign up with Mobile Number")
                                .foregroundStyle(Color.primary)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
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

#Preview {
    EmailRegistrationView()
}
