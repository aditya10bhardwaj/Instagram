//
//  AccountView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct AccountView: View {
    
    @Environment(AuthManager.self) var authManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    UserDetailsView()
                    
                    UserPostAndStoryView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 12) {
                        Image(systemName: "lock")
                        Text("aditya_bhardwaj._58")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 12) {
                        Text("@")
                            .font(.system(size: 24))
                        
                        Image(systemName: "plus.app")
                        
                        NavigationLink {
                            Button("Sign Out") {
                                signOut()
                            }
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundStyle(Color.primary)
                        }
                    }
                }
            }
        }
    }
}

private extension AccountView {
    func signOut() {
        Task { await authManager.signOut() }
    }
}

#Preview {
    AccountView()
        .environment(AuthManager())
}
