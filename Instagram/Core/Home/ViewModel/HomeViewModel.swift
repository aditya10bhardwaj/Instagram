//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var persons: [Person] = []
    
    init() {
        getFollowing()
    }
    
    func getFollowing() {
        self.persons = Person.MOCK_DATA
    }
}
