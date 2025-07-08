//
//  FullnameView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct FullnameView: View {
    
    @Binding var email: String
    @Binding var age: Int
    @Environment(\.dismiss) private var dismiss
    @State var fullname: String = ""
    
    var onFinish: () -> Void

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("What's your name?")
                        .font(.title)
                        .fontWeight(.regular)
                        
                    Text("Add your name so that friends can find you.")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
                TextFieldView(inputText: $fullname, placeholder: "Full name")
                
                VStack(spacing: 12) {
                    NavigationLink {
                        InstagramTermsAndConditionsView(email: $email, age: $age, fullname: $fullname, onFinish: {
                            onFinish()
                        })
                    } label: {
                        Text("Next")
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
//    FullnameView(email: .constant(""), age: .constant(18))
}
