//
//  CachedImageViewModel.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 19/10/25.
//

import Foundation
import SwiftUI

@MainActor
@Observable
class CachedImageViewModel {
    
    private(set) var image: UIImage?
    private(set) var loading = false
    private(set) var error: Error?
    
    func load(url: String) async {
        loading = true
        error = nil
        
        do {
            image = try await ImageDataService.shared.download(url: url)
        } catch {
            self.error = error
            print("Error downloading image: \(error)")
        }
        
        loading = false
    }
}
