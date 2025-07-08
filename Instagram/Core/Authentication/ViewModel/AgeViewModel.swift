//
//  AgeViewModel.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 08/07/25.
//

import SwiftUI

@MainActor
class AgeViewModel: ObservableObject {
    private var supabaseService: SupabaseService
    var email: String?
    
    init(supabaseService: SupabaseService = SupabaseService()) {
        self.supabaseService = supabaseService
        getEmail()
    }
    
    func getEmail() {
        Task {
            let currentUser = try await supabaseService.getCurrentUser()
            self.email = currentUser.email
        }
    }
}
