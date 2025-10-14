//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI

@MainActor
@Observable
class HomeViewModel {
    
    private(set) var posts: [Post] = []
    private var page = 1
    private var isLoading = false
    private var hasMore = true
    
    private let postDataService = PostDataService()
    
    func fetchPosts() async {
        
        guard !isLoading, hasMore else {
            return
        }
        
        self.isLoading = true
        
        do {
            let posts = try await postDataService.getPosts(page: self.page)
            self.posts.append(contentsOf: posts.data)
            self.page += 1
            hasMore = posts.next != nil
        } catch {
            print("Error fetching posts: \(error)")
        }
        
        self.isLoading = false
    }
}
