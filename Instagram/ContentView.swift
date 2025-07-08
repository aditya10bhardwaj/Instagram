//
//  ContentView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("didShowOnboarding") var didShowOnboarding: Bool = false
    @Environment(AuthManager.self) private var authManager
    @Environment(PersonManager.self) private var personManager
    
    var body: some View {
        Group {
            if authManager.currentUser == nil  {
                LoginView()
            } else if authManager.currentUser != nil && !didShowOnboarding {
                AgeView(onFinish: {
                    didShowOnboarding = true
                })
            } else {
                MainTabBar()
            }
        }
        .task {
            await authManager.refreshUser()
            if let user = authManager.currentUser {
                await personManager.refreshPerson(with: user.email)
            }
        }
    }
}

#Preview {
    ContentView(didShowOnboarding: false)
        .environment(AuthManager())
        .environment(PersonManager())
}
