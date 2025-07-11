//
//  UsernameView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct UsernameView: View {
    
    @Binding var email: String
    @Binding var age: Int
    @Binding var fullname: String
    @Binding var profileImage: String
    @Environment(\.dismiss) private var dismiss
    @Environment(PersonManager.self) private var personManager
    @State private var username: String = ""
    
    var onFinish: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Review your username")
                        .font(.title)
                        .fontWeight(.regular)
                        
                    Text("Add a username or use our suggestion. You can change this at any time.")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
                ZStack(alignment: .trailing) {
                    TextFieldView(inputText: $username, placeholder: "Username")
                    
                    if username != "" {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.systemGreen))
                            .offset(x: -30)
                    }
                }
                
                VStack(spacing: 12) {
                    Button {
                        uploadCurrentPersonData()
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

private extension UsernameView {
    func uploadCurrentPersonData() {
        let person = Person(id: UUID(), fullName: fullname, email: email, username: username, profileImage: profileImage, age: age, bio: "Hello", followers: 0, followings: 0, posts: "NA", reels: "NA")
        Task {
            await personManager.uploadCurrentPersonData(to: email, person: person)
        }
        personManager.currentPerson = person
        onFinish()
    }
}

#Preview {
//    UsernameView(email: .constant(""), age: .constant(18), fullname: .constant(""), profileImage: .constant("Aditya"), onFinish: )
}
