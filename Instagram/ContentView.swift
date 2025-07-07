//
//  ContentView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AuthManager.self) private var authManager
    
    var body: some View {
        Group {
            if let _ = authManager.currentUser {
                MainTabBar()
            } else {
                LoginView()
            }
        }
        .task { await authManager.refreshUser() }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
}
