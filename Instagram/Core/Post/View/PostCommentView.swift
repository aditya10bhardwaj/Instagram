//
//  PostCommentView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct PostCommentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 18) {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Image(systemName: "bubble.right")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Image(systemName: "arrow.up.forward")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Spacer()
                
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 18, height: 20)
            }
            
            HStack {
                StoryViewCell(person: Person.MOCK_DATA.first!, width: 18, height: 18)
                
                Text("Like by")
                
                Text("aditya_bhardwaj._58")
                    .fontWeight(.semibold)
                
                Text("and")
                
                Text("others")
                    .fontWeight(.semibold)
            }
            
            HStack {
                Text("aditya_bhardwaj._58")
                    .fontWeight(.semibold)
                
                Text("Nice photo!")
            }
            
            Text("24 May 2019")
                .font(.caption)
                .foregroundStyle(Color(.systemGray))
        }
        .padding(.horizontal)
    }
}

#Preview {
    PostCommentView()
}
