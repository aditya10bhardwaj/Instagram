//
//  PostHeaderView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct PostHeaderView: View {
    var body: some View {
        HStack {
            StoryViewCell(person: Person.MOCK_DATA.first!, width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text("Aditya Bhardwaj")
                    .font(.headline)
                
                Text("@adityabhardwaj")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "list.bullet")
        }
        .padding(.horizontal)
    }
}

#Preview {
    PostHeaderView()
}
