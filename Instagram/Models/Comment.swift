//
//  Comment.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import Foundation

struct Comment: Codable {
    let id: String
    let username, text: String
    let timestamp: Date
}
