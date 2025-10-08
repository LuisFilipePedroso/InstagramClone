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
}

#Preview {
    Home()
}
