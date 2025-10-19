//
//  CachedImage.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 19/10/25.
//

import SwiftUI

struct CachedImage: View {
    
    let url: String
    @State private var viewModel = CachedImageViewModel()
    
    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
            } else if viewModel.loading {
                ProgressView()
            } else if viewModel.error != nil {
                Image(systemName: "exclamationmark.triangle")
            } else {
                Color.gray.opacity(0.3)
            }
        }
        .task {
            await viewModel.load(url: url)
        }
    }
}

#Preview {
    CachedImage(url: "")
}
