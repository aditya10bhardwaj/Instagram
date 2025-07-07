//
//  UserDetailsView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct UserDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    StoryViewCell(width: 100, height: 100)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 28, height: 28)
                        .offset(x: -6, y: -2)
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: -7, y: -3)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Aditya Bhardwaj")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("0")
                                .fontWeight(.bold)
                            Text("posts")
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("344")
                                .fontWeight(.bold)
                            Text("followers")
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("377")
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
                Text("Garv se kaho hum hindu hai")
                Text("@ aditya_bhardwaj._58")
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
    UserDetailsView()
}
