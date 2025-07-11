//
//  OnboardingManager.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 10/07/25.
//

import Foundation
import Observation

@Observable
@MainActor
class OnboardingManager {
    private let supabaseService: SupabaseService
    var didOnboard: Bool = false
    
    init(supabaseService: SupabaseService = SupabaseService()) {
        self.supabaseService = supabaseService
    }
    
    func checkStatus() async {
        do {
            self.didOnboard = try await supabaseService.didOnboard()
        } catch {
            print("DEBUG: Failed to check onboarding status: \(error.localizedDescription)")
        }
    }
    
    func updateOnboardingStatus() async {
        do {
            try await supabaseService.updateOnboardingStatus()
        } catch {
            print("DEBUG: Failed to update onboarding status: \(error.localizedDescription)")
        }
    }
}
