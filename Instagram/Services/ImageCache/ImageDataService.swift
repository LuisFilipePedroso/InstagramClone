//
//  ImageDataService.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 19/10/25.
//

import Foundation
import SwiftUI

actor ImageDataService {
    
    private var imageCacheService = ImageCacheService()
    static var shared = ImageDataService()
    
    private init() {}
    
    func download(url: String) async throws -> UIImage {
        do {
            guard let url = URL(string: url) else {
                throw URLError(URLError.badURL)
            }
            
            if let image = await imageCacheService.get(key: url.absoluteString) {
                return image
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let image = UIImage(data: data) {
                await imageCacheService.add(image: image, key: url.absoluteString)
                return image
            }
            
            throw URLError(URLError.cannotDecodeRawData)
        } catch {
            await imageCacheService.remove(key: url)
            throw error
        }
    }
}
