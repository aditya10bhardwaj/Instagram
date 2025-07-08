//
//  ProfileImageView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct ProfileImageView: View {
    
    @Binding var email: String
    @Binding var age: Int
    @Binding var fullname: String
    @State private var profileImage: String = "Aditya"
    
    var onFinish: () -> Void

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                VStack(alignment: .leading) {
                    Text("Add a profile picture")
                        .font(.title)
                        .fontWeight(.regular)
                        
                    Text("Add a profile picture so that your friends know it's you. Everyone will be able to see your picture.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Spacer()
                
                Divider()
                
                VStack(spacing: 12) {
                    NavigationLink {
                        
                    } label: {
                        Text("Add Picture")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                    }
                    
                    NavigationLink {
                        UsernameView(email: $email, age: $age, fullname: $fullname, profileImage: $profileImage, onFinish: {
                            onFinish()
                        })
                    } label: {
                        Text("Skip")
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
//    ProfileImageView(email: .constant(""), age: .constant(18), fullname: .constant(""))
}
