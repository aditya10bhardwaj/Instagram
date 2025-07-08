//
//  StoryView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct StoryView: View {
    
    @State var currentPerson: Person
    @State var persons: [Person]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ZStack(alignment: .bottomTrailing) {
                    StoryViewCell(person: Person.MOCK_DATA.first!, width: 100, height: 100)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 28, height: 28)
                        .offset(x: -6, y: -2)
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: -7, y: -3)
                }
                
                ForEach(persons) { person in
                    VStack(spacing: 10) {
                        StoryViewCell(person: person, width: 80, height: 80)
                        
                        Text(person.username)
                            .font(.caption2)
                            .frame(width: 80, alignment: .center)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoryView(currentPerson: Person.MOCK_DATA.first!, persons: Person.MOCK_DATA)
}
