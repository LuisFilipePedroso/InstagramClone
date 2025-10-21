//
//  ContentView.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI

struct Home: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    @State private var headerOpacity: Double = 1
    @State private var showFullDescription: Bool = false
    
    var body: some View {
        @Bindable var viewModel = homeViewModel
        
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
            await homeViewModel.fetchPosts()
        }
        .sheet(item: $viewModel.activePost, onDismiss: {
            homeViewModel.activePost = nil
        }) { post in
            Comments(post: post)
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
        ForEach(homeViewModel.posts) { post in
            FeedItem(post: post)
                .padding()
                .onAppear {
                    if post.id == homeViewModel.posts.last?.id {
                        Task {
                            await homeViewModel.fetchPosts()
                        }
                    }
                }
        }
    }
    
}

#Preview {
    Home()
}
