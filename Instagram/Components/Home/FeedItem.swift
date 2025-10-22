//
//  Feed.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 21/10/25.
//

import SwiftUI

struct FeedItem: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            HStack {
                CachedImage(url: post.userAvatar)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.username)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundStyle(.primaryText)
            CachedImage(url: post.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            FeedActionButtons(post: post)
            FeedCaption(post: post)
            
            HStack {
                Text(post.timestamp.asShortString())
                    .font(.caption)
                    .foregroundStyle(.secondaryText)
                    .padding(.top, 4)
                
                Spacer()
            }
        }
    }
}

#Preview {
    FeedItem(post: Post.preview)
}
