//
//  ContentView.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Header
                Reels
            }
            .padding(.top, 8)
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
}

#Preview {
    Home()
}
