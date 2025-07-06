//
//  RegistrationView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct MobileNumberRegistrationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var mobileNumber: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("What's your mobile number?")
                            .font(.title)
                            .fontWeight(.regular)
                            
                        Text("Enter the mobile number on which you can be contacted. No one will see this on your profile.")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                    .padding(.trailing)
                    
                    TextFieldView(inputText: $mobileNumber, placeholder: "Mobile Number")
                        .padding(.vertical)
                    
                    Text("You may receive WhatsApp and SMS notifications from us for security and login purposes.")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.trailing)
                    
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
                        
                        NavigationLink {
                            EmailRegistrationView()
                        } label: {
                            Text("Sign up with email address")
                                .foregroundStyle(Color.primary)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.vertical)
                    .padding()
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
    MobileNumberRegistrationView()
}
