//
//  StoryViewCell.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct StoryViewCell: View {
    
    @State var person: Person
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(person.profileImage)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .foregroundStyle(.black.opacity(0.3))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red.opacity(0.3).gradient, lineWidth: 2)
            )
    }
}

#Preview {
    StoryViewCell(person: Person.MOCK_DATA.first!, width: 360, height: 360)
}
