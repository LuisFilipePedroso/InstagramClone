//
//  ActionButtons.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 21/10/25.
//

import SwiftUI

struct FeedActionButtons: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    let post: Post
    
    var body: some View {
        HStack {
            ActionButton(iconName: "heart", text: post.likes)
            ActionButton(iconName: "bubble.right", text: post.comments.count)
                .onTapGesture {
                    homeViewModel.activePost = post
                }
            ActionButton(iconName: "arrow.2.squarepath", text: post.reposts)
            ActionButton(iconName: "paperplane", text: post.sends)
            Spacer()
            Image(systemName: "bookmark")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.primaryText)
        }
        .padding(.top, 8)
    }
    
    private func ActionButton(iconName: String, text: Int) -> some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 15, weight: .semibold))
            Text("\(text)")
        }
        .foregroundStyle(.primaryText)
    }
}

#Preview {
    FeedActionButtons(post: Post.preview)
}
