//
//  HomeView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                StoryView()
                
                Divider()
                    .frame(height: 5)
                
                ForEach(0 ... 10, id: \.self) { _ in
                    PostView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Instagram")
                        .font(.system(size: 28, weight: .semibold))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 12) {
                        Image(systemName: "heart")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "arrow.up.forward")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
