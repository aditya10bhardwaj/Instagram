//
//  MainTabBar.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct MainTabBar: View {
    
    @State private var selectedTab: String = "home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("home")
                .tabItem {
                    Image(systemName: selectedTab == "home" ? "house.fill" : "house")
                    
                }
            
            ExploreView()
                .tag("explore")
                .tabItem {
                    Image(systemName: selectedTab == "explore" ? "safari.fill" : "safari")
                }
            
            CameraView()
                .tag("camera")
                .tabItem {
                    Image(systemName: "plus.app")
                }
            
            ReelView()
                .tag("reel")
                .tabItem {
                    Image(systemName: selectedTab == "reel" ? "play.circle.fill" : "play.circle")
                }
            
            AccountView()
                .tag("account")
                .tabItem {
                    Image(systemName: selectedTab == "account" ? "person.circle.fill" : "person.circle")
                }
        }
        .tint(Color.primary)
    }
}

#Preview {
    MainTabBar()
}
