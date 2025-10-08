//
//  Post.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import Foundation

struct PostResponse: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let id: Int
    let username: String
    let userAvatar, imageURL: String
    let caption: String
    let likes: Int
    let timestamp: Date
    let comments: [Comment]

    enum CodingKeys: String, CodingKey {
        case id, username, userAvatar
        case imageURL = "imageUrl"
        case caption, likes, timestamp, comments
    }
}
