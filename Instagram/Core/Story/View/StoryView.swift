//
//  StoryView.swift
//  Instagram
//
//  Created by Aditya Bhardwaj on 06/07/25.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(0 ... 10, id: \.self) { _ in
                    VStack(spacing: 10) {
                        StoryViewCell(width: 80, height: 80)
                        
                        Text("aditya_bhardwaj._58")
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
    StoryView()
}
