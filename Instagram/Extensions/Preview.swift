//
//  Preview.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 16/10/25.
//

import Foundation
import SwiftUI

extension Post {
    static var preview: Post {
        let dateString = "2025-10-07T18:30:00Z"
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: dateString) ?? Date()
        
        return Post(
            id: "0199dfe3be56-2b040c98f860ec42-0000",
            username: "alex_photo",
            userAvatar: "https://picsum.photos/seed/user1/100/100",
            imageURL: "https://picsum.photos/seed/post1/600/600",
            caption: "Beautiful sunset at the beach ðŸŒ…",
            likes: 342,
            reposts: 40,
            sends: 5,
            timestamp: date,
            comments: [
                Comment(
                    id: "0199dfe3be56-30160a76838d8134-c0-0",
                    username: "sarah_m",
                    userAvatar: "https://picsum.photos/seed/sarah_m/100/100",
                    text: "Stunning shot!",
                    likes: 12,
                    timestamp: date
                )
            ]
        )
    }
}
