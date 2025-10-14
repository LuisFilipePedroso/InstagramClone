//
//  Post.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import Foundation

class PostDataService {
    
    func getPosts(page: Int) async throws -> PostResponse {
        let postsUrl = Configuration.url(for: .posts)
        var components = URLComponents(string: postsUrl.absoluteString)
        components?.queryItems = [
            URLQueryItem(name: "_page", value: "\(page)"),
            URLQueryItem(name: "_per_page", value: "10")
        ]
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
//        let response = try decoder.decode([Post].self, from: data)
        let response = try decoder.decode(PostResponse.self, from: data)
        return response
    }
}
