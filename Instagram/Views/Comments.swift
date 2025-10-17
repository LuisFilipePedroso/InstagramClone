//
//  Comments.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 16/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct Comments: View {
    
    @State private var comment: String = ""
    var post: Post
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Comments")
                    .foregroundStyle(.primaryText)
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
                
                ScrollView {
                    LazyVStack {
                        ForEach(post.comments) { comment in
                            CommentsListItem(comment: comment)
                        }
                    }
                }
                
                VStack {
                    Divider()
                        .background(.surface)
                    
                    HStack() {
                        Text("♥️")
                        Text("😎")
                        Text("🚀")
                        Text("🥳")
                        Text("🧐")
                        Text("🔥")
                        Text("😂")
                        Spacer()
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    
                    HStack {
                        Circle()
                            .fill(Color.surface)
                            .frame(width: 48, height: 48)
                        
                        TextField(
                            "",
                            text: $comment,
                            prompt: Text("Add a comment for \(post.username)")
                                .foregroundStyle(.secondaryText)
                                .font(.subheadline)
                        )
                        .foregroundStyle(.secondaryText)
                        .frame(height: 40)
                        .padding(.horizontal, 16)
                        .overlay(
                            Capsule()
                                .stroke(Color.surface, lineWidth: 2)
                        )
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                }
            }
            .presentationDragIndicator(.visible)
        }
    }
    
    private func CommentsListItem(comment: Comment) -> some View {
        HStack(spacing: 12) {
            WebImage(url: URL(string: comment.userAvatar))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 6) {
                Text(comment.username)
                    .font(.subheadline)
                Text(comment.text)
                
                HStack(spacing: 12) {
                    Text("Reply")
                    Text("See translation")
                }
                .font(.subheadline)
                .foregroundStyle(.secondaryText)
                .padding(.top, 8)
            }
            .foregroundStyle(.primaryText)

            Spacer()
            
            VStack {
                Image(systemName: "heart")
                    .foregroundStyle(.secondaryText)
                
                Text("\(comment.likes)")
                    .font(.subheadline)
                    .foregroundStyle(.secondaryText)
                    .padding(.top, 8)
            }
        }
        .padding(.top, 32)
        .padding(.horizontal)
    }
}

#Preview {
    Comments(post: Post.preview)
}
