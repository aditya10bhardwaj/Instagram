//
//  PersonService.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation
import Supabase

extension SupabaseService {
    
    func createPersonData(person: Person) async throws {
        try await client
            .from("person")
            .insert(person)
            .execute()
    }
    
    func fetchCurrentPersonData(with email: String) async throws -> Person {
        let response = try await client
            .from("person")
            .select()
            .eq("email", value: email)
            .execute()
        
        let data = try JSONDecoder().decode([Person].self, from: response.data)
        
        return data.first!
    }
    
    func uploadCurrentPersonData(to email: String, person: Person) async throws {
        try await client
            .from("person")
            .update(person)
            .eq("email", value: email)
            .execute()
    }
}
