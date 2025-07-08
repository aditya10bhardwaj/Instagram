//
//  SupabaseAuthService.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation
import Observation

@Observable
@MainActor
class AuthManager {
    private let authService: SupabaseService
    var currentUser: User? = nil
    
    init(authService: SupabaseService = SupabaseService()) {
        self.authService = authService
    }
    
    func signUp(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signUp(email: email, password: password)
        } catch {
            print("DEBUG: Sign up error: \(error.localizedDescription)")
        }
    }
    
    func signIn(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signIn(email: email, password: password)
        } catch {
            print("DEBUG: Sign in error: \(error.localizedDescription)")
        }
    }
    
    func signOut() async {
        do {
            try await authService.signOut()
            currentUser = nil
        } catch {
            print("DEBUG: Sign out error: \(error.localizedDescription)")
        }
    }
    
    func refreshUser() async {
        do {
            self.currentUser = try await authService.getCurrentUser()
        } catch {
            print("DEBUG: Failed to get current user: \(error.localizedDescription)")
            self.currentUser = nil
        }
    }
}
