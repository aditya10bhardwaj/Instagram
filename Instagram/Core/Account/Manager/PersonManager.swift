//
//  PersonManager.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation
import Observation

@Observable
@MainActor
class PersonManager {
    private let personService: SupabaseService
    var currentPerson: Person? = nil
    
    init(personService: SupabaseService = SupabaseService()) {
        self.personService = personService
    }
    
    func fetchCurrentPerson() async {
        do {
            let currentUser = try await personService.getCurrentUser()
            self.currentPerson = try await personService.fetchCurrentPersonData(with: currentUser.email)
        } catch {
            print("DEBUG: Failed to get current person data: \(error.localizedDescription)")
        }
    }
    
    func uploadCurrentPersonData(to email: String, person: Person) async {
        do {
            try await personService.uploadCurrentPersonData(to: email, person: person)
        } catch {
            print("DEBUG: Failed to upload current person data: \(error.localizedDescription)")
        }
    }
    
    func refreshPerson(with email: String) async {
        do {
            self.currentPerson = try await personService.fetchCurrentPersonData(with: email)
        } catch {
            print("DEBUG: Failed to refresh person")
        }
    }
}
