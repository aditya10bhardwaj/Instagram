//
//  UserPostAndStoryView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 07/07/25.
//

import SwiftUI

struct UserPostAndStoryView: View {
    
    @State private var selectedControl: Int = 0
    
    var body: some View {
        VStack(spacing: 18) {
            Picker("H", selection: $selectedControl) {
                Image(systemName: "square.grid.3x3.fill").tag(0)
                Text("person.circle").tag(1)
            }
            .pickerStyle(.segmented)
            .background(Color.white)
            
            Group {
                if selectedControl == 0 {
                    LazyVGrid(columns: [.init(), .init(), .init()], spacing: 1) {
                        ForEach(0 ... 10, id: \.self) { _ in
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 3 - 11, height: UIScreen.main.bounds.width / 3 - 11)
                                .background(
                                    Color.gray
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 0)
                                        .stroke(Color.gray, lineWidth: 0)
                                )
                        }
                    }
                } else {
                    ContentUnavailableView("No Stories yet", systemImage: "camera.circle")
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserPostAndStoryView()
}
