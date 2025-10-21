//
//  Post.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 21/10/25.
//

import Foundation
import SwiftUI

extension Post {
    
    func getCaptionText() -> AttributedString {
        var result = AttributedString(self.username)
        result.font = .subheadline.weight(.semibold)
        
        var caption = AttributedString(" " + self.caption)
        caption.font = .subheadline.weight(.regular)
        
        result.append(caption)
        return result
    }
}
