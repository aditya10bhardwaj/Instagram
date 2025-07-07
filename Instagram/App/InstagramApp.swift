//
//  InstagramApp.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 05/07/25.
//

import SwiftUI

@main
struct InstagramApp: App {
    
    @State private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authManager)
        }
    }
}
