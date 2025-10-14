//
//  Post.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import Foundation

struct PostResponse: Codable {
    let data: [Post]
    let next: Int?
}

struct Post: Codable, Identifiable {
    let id: String
    let username: String
    let userAvatar, imageURL: String
    let caption: String
    let likes: Int
    let reposts: Int
    let sends: Int
    let timestamp: Date
    let comments: [Comment]

    enum CodingKeys: String, CodingKey {
        case id, username, userAvatar
        case imageURL = "imageUrl"
        case caption, likes, reposts, sends, timestamp, comments
    }
}
