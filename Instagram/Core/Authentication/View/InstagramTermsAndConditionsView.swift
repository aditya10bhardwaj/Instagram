//
//  InstagramTermsAndConditionsView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct InstagramTermsAndConditionsView: View {
    
    @Binding var email: String
    @Binding var age: Int
    @Binding var fullname: String
    @Environment(\.dismiss) private var dismiss
    
    var onFinish: () -> Void

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Agree to Instagram's terms and policies")
                        .font(.title)
                        .fontWeight(.regular)
                        
                    Text("People who use our service may have uploacded your contact information to Instagram. Learn more")
                        .font(.headline)
                        .fontWeight(.regular)
                    
                    Text("By tapping I agree, you agree to create an account and to Instagram's Terms, Privacy Policy and Cookies Policy.")
                        .font(.headline)
                        .fontWeight(.regular)
                    
                    Text("The Privacy Policy describes the ways we can use the information we collect when you create an account. For example, we use this informatino to provide, personalise and improve our products, including ads.")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
                VStack(spacing: 12) {
                    NavigationLink {
                        ProfileImageView(email: $email, age: $age, fullname: $fullname, onFinish: {
                            onFinish()
                        })
                    } label: {
                        Text("I agree")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                    }
                    
                }
                .padding(.horizontal)
                
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
//    InstagramTermsAndConditionsView(email: .constant(""), age: .constant(18), fullname: .constant(""))
}
