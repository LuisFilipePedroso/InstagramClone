//
//  ContentView.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @State private var headerOpacity: Double = 1
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background.ignoresSafeArea()
            
            VStack {
                Header
                    .opacity(headerOpacity)
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        Reels
                        Feed
                    }
                    .padding(.top, 8)
                }
                .onScrollGeometryChange(for: CGFloat.self) { geometry in
                    geometry.contentOffset.y
                } action: { oldValue, newValue in
                    let fadeDistance: CGFloat = 100
                    let opacity = 1.0 - (newValue / fadeDistance)
                    headerOpacity = max(0, min(1, opacity))
                }

            }
        }
        .task {
            await viewModel.fetchPosts()
        }
    }
    
    private var Header: some View {
        HStack {
            Text("Instagram")
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            HStack(spacing: 24) {
                Image(systemName: "heart")
                Image(systemName: "message")
            }
            .font(.system(size: 18, weight: .bold))
        }
        .foregroundStyle(.secondaryText)
        .padding(.horizontal)
    }
    
    private var Reels: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 16) {
                ForEach(0..<10) { _ in
                    VStack {
                        Circle()
                            .fill(Color.surface)
                            .frame(width: 64, height: 64)
                        Text("johndoe")
                            .foregroundStyle(.secondaryText)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 24)
        }
    }
    
    private var Feed: some View {
        ForEach(viewModel.posts) { post in
            VStack {
                HStack {
                    WebImage(url: URL(string: post.userAvatar))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(post.username)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .font(.system(size: 18, weight: .bold))
                }
                .foregroundStyle(.primaryText)
                WebImage(url: URL(string: post.imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                HStack {
                    FeedActionButton(iconName: "heart", text: post.likes)
                    FeedActionButton(iconName: "bubble.right", text: post.comments.count)
                    FeedActionButton(iconName: "arrow.2.squarepath", text: post.reposts)
                    FeedActionButton(iconName: "paperplane", text: post.sends)
                    Spacer()
                    Image(systemName: "bookmark")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.primaryText)
                }
                .padding(.top, 8)
                    
            }
            .padding()
            .onAppear {
                if post.id == viewModel.posts.last?.id {
                    Task {
                        await viewModel.fetchPosts()
                    }
                    print("Last: \(post)")
                }
            }
        }
    }
    
    private func FeedActionButton(iconName: String, text: Int) -> some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 18, weight: .bold))
            Text("\(text)")
        }
        .foregroundStyle(.primaryText)
    }
}

#Preview {
    Home()
}
