//
//  ContentView.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI

struct Home: View {
    
    @State private var headerOpacity: Double = 1
    
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
        .foregroundStyle(.primaryText)
        .padding(.horizontal)
    }
    
    private var Reels: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 16) {
                ForEach(0..<10) { _ in
                    Circle()
                        .fill(Color.surface)
                        .frame(width: 64, height: 64)
                }
            }
            .padding(.horizontal)
            .padding(.top, 24)
        }
        
    }
    
    private var Feed: some View {
        LazyVStack {
            ForEach(0..<100, id: \.self) { _ in
                HStack {
                    Circle()
                        .fill(Color.surface)
                        .frame(width: 32, height: 32)
                    Text("luisfpedroso")
                    Spacer()
                    Image(systemName: "ellipsis")
                        .font(.system(size: 18, weight: .bold))
                }
                .foregroundStyle(.primaryText)
            }
        }
    }
}

#Preview {
    Home()
}
