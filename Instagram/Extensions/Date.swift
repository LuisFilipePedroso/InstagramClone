//
//  Date.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 20/10/25.
//

import Foundation

extension Date {
    
    private var abbreviatedFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 1
        
        return formatter
    }
    
    func asAbbreviatedString() -> String {
        let from = Date().timeIntervalSince(self)
        return abbreviatedFormatter.string(from: from) ?? ""
    }

    private var shortFormatter: RelativeDateTimeFormatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter
    }
    
    func asShortString() -> String {
        return shortFormatter.localizedString(for: self, relativeTo: Date())
    }
}
