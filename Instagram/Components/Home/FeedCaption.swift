//
//  FeedCap.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 21/10/25.
//
import SwiftUI

struct FeedCaption: View {
    
    @State private var showFullDescription: Bool = false
    let post: Post
    
    var body: some View {
        HStack {
            Text(post.getCaptionText())
                .lineLimit(showFullDescription ? nil : 1)
                .foregroundStyle(.primaryText)
            
            if post.caption.count > 50 && !showFullDescription {
                Button {
                    withAnimation(.easeInOut) {
                        showFullDescription.toggle()
                    }
                } label: {
                    Text(showFullDescription ? "Less" : "more...")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondaryText)
                }
            }
        }
        .padding(.top, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
