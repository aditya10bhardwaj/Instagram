//
//  SupabaseService.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation
import Supabase

struct SupabaseService {
    let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(supabaseURL: URL(string: Constants.publicURLString)!, supabaseKey: Constants.projectAPIKey)
    }
    
    func signUp(email: String, password: String) async throws -> User {
        let response = try await client.auth.signUp(email: email, password: password)
        
        guard let email = response.user.email else {
            throw NSError()
        }
        
        try await createPersonData(person: Person(id: response.user.id, fullName: "test", email: email, username: "test", profileImage: "test", age: -1, bio: "test", followers: -1, followings: -1, posts: "test", reels: "test"))
        try await onboardUser(with: email)
        
        return User(id: response.user.id, email: response.user.email!)
    }
    
    func signIn(email: String, password: String) async throws -> User {
        let response = try await client.auth.signIn(email: email, password: password)
        
        guard let _ = response.user.email else {
            throw NSError()
        }
        
        return User(id: response.user.id, email: response.user.email!)
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    func getCurrentUser() async throws -> User {
        let supabaseUser = try await client.auth.session.user
        
        guard let _ = supabaseUser.email else {
            throw NSError()
        }
        
        return User(id: supabaseUser.id, email: supabaseUser.email!)
    }
}
