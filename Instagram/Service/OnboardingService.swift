//
//  OnboardingService.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 10/07/25.
//

import Foundation

private struct Onboard: Codable {
    var email: String
    var didOnboard: Bool
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case didOnboard = "didOnboard"
    }
}

extension SupabaseService {
    func onboardUser(with email: String) async throws {
        let data = Onboard(email: email, didOnboard: false)
        
        try await client
            .from("didOnboard")
            .insert(data)
            .execute()
    }
    
    func didOnboard() async throws -> Bool {
        let user = try await getCurrentUser()
        
        let response = try await client
            .from("didOnboard")
            .select()
            .eq("email", value: user.email)
            .single()
            .execute()
        
        
        let res = try JSONDecoder().decode(Onboard.self, from: response.data)
        print(res)
        return res.didOnboard
    }
    
    func updateOnboardingStatus() async throws {
        let user = try await getCurrentUser()
        let data = Onboard(email: user.email, didOnboard: true)
        try await client
            .from("didOnboard")
            .update(data)
            .eq("email", value: user.email)
            .execute()
    }
}
