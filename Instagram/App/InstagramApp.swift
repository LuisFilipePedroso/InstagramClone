//
//  InstagramApp.swift
//  Instagram
//
//  Created by Luis Filipe Pedroso on 08/10/25.
//

import SwiftUI

@main
struct InstagramApp: App {
    
    @State private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Home()
            }
            .environment(homeViewModel)
        }
    }
}
