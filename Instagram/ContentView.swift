//
//  ContentView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AuthManager.self) private var authManager
    @Environment(PersonManager.self) private var personManager
    @Environment(OnboardingManager.self) private var onboardingManager
    @State private var isLoading: Bool = true
    
    var body: some View {
        Group {
            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
            } else {
                if authManager.currentUser == nil  {
                    LoginView()
                } else if authManager.currentUser != nil && onboardingManager.didOnboard == false {
                    AgeView {
                        onboardingManager.didOnboard = true
                    }
                } else {
                    MainTabBar()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isLoading = false
            }
        }
        .animation(.easeInOut, value: isLoading)
        .task {
            await authManager.refreshUser()
            await onboardingManager.checkStatus()
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
        .environment(PersonManager())
        .environment(OnboardingManager())
}
