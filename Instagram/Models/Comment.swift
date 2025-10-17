//
//  Comment.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: String
    let username, userAvatar, text: String
    let likes: Int
    let timestamp: Date
}
