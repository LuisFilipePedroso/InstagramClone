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
    @State private var selectedDetent: PresentationDetent = .medium
    @FocusState private var isInputFocused: Bool
    
    var post: Post
    var emojis: [Int]
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Comments")
                    .foregroundStyle(.primaryText)
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.top, 24)
                
                ScrollView {
                    LazyVStack {
                        ForEach(post.comments) { comment in
                            CommentsListItem(comment: comment)
                        }
                    }
                }
                
                VStack(spacing: 8) {
                    Divider()
                        .background(.surface)
                    
                    HStack(spacing: 14) {
                        ForEach(emojis, id: \.self) { emoji in
                            Text(String(Unicode.Scalar(emoji)!))
                        }
                    }
                    .padding(.horizontal)
                    .font(.title2)
                    
                    HStack {
                        WebImage(url: URL(string: post.userAvatar))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        TextField(
                            "",
                            text: $comment,
                            prompt: Text("Add a comment for \(post.username)")
                                .foregroundStyle(.secondaryText)
                                .font(.subheadline)
                        )
                        .focused($isInputFocused)
                        .foregroundStyle(.secondaryText)
                        .frame(height: 40)
                        .padding(.horizontal, 16)
                        .overlay(
                            Capsule()
                                .stroke(Color.surface, lineWidth: 2)
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
            }
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
            .onChange(of: isInputFocused) { _, newValue in
                if newValue {
                    selectedDetent = .large
                } else {
                    selectedDetent = .medium
                }
            }
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
                HStack(spacing: 8) {
                    Text(comment.username)
                        .font(.subheadline)
                    
                    Text(comment.timestamp.asAbbreviatedString())
                        .font(.caption)
                        .foregroundStyle(.secondaryText)
                }
                
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
    Comments(post: Post.preview, emojis: [])
}
