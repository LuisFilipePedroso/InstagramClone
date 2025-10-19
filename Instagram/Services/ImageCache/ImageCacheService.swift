//
//  ImageCacheService.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 19/10/25.
//

import Foundation
import SwiftUI

actor ImageCacheService {
    
    var imageCache: NSCache<NSString, UIImage> {
        let cache = NSCache<NSString, UIImage>()
//        cache.countLimit = 100
//        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }
    
    func add(image: UIImage, key: String) {
        imageCache.setObject(image, forKey: key as NSString)
    }
    
    func remove(key: String) {
        imageCache.removeObject(forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }
    
}
