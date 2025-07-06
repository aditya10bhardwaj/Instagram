//
//  StoryViewCell.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct StoryViewCell: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .foregroundStyle(.black.opacity(0.3))
            .overlay(
                Circle()
                    .stroke(Color.red.opacity(0.3).gradient, lineWidth: 2)
            )
    }
}

#Preview {
    StoryViewCell(width: 60, height: 60)
}
