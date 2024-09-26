//
//  ContentView.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import SwiftUI

struct ContentView: View {
    
    static let username = "giovaninb"
    
    var body: some View {
        NavigationView {
            RepoListCoordinator(username: Self.username)
        }
    }
}
