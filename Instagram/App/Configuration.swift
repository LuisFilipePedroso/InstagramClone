//
//  Configuration.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 13/10/25.
//

import Foundation

enum Configuration {
    
    static let baseURL = "http://192.168.15.66:3000"
    
    enum Endpoint {
        case posts
        
        var path: String {
            switch self {
                case .posts:
                    return "/posts"
            }
        }
    }
    
    static func url(for endpoint: Endpoint) -> URL {
        URL(string: baseURL + endpoint.path)!
    }
}
