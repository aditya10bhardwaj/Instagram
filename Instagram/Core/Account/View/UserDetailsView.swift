//
//  UserDetailsView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct UserDetailsView: View {
    
    @State var person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    StoryViewCell(person: person, width: 100, height: 100)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 28, height: 28)
                        .offset(x: -6, y: -2)
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: -7, y: -3)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(person.username)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(person.postsCount)")
                                .fontWeight(.bold)
                            Text("posts")
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("\(person.followers)")
                                .fontWeight(.bold)
                            Text("followers")
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("\(person.followings)")
                                .fontWeight(.bold)
                            Text("following")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(person.bio)
                Text("@ \(person.username)")
                    .fontWeight(.semibold)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .foregroundStyle(Color.primary)
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(height: 32)
                )
                
                Button {
                    
                } label: {
                    Text("Share Profile")
                        .foregroundStyle(Color.primary)
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(height: 32)
                )
                
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .foregroundStyle(Color.primary)
                }
                .frame(width: 32)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                        .frame(height: 32)
                )
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserDetailsView(person: Person.MOCK_DATA.first!)
}
