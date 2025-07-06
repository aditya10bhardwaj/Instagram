//
//  PostView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        PostHeaderView()
        
        Image("")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 480)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 2)
            )
        
        PostCommentView()
    }
}

#Preview {
    PostView()
}
