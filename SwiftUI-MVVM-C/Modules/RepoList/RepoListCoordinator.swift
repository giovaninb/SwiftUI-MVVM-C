//
//  RepoListCoordinator.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import SwiftUI

struct RepoListCoordinator: View {
    @State private var selectedRepo: Repo?
    @State private var isProfilePresented = false
    
    @Environment(\.openURL) var openURL
    
    let username: String
    
    var body: some View {
        VStack {
            RepoListView(tapOnRepoAction: { repo in
                selectedRepo = repo
            })
            .listStyle(PlainListStyle())
            .navigationBarTitle("\(username)'s repos", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isProfilePresented = true
            }, label: {
                Image(systemName: "person.crop.circle")
                    .tint(.black)
            }))
            
            if let selectedRepo = selectedRepo {
                EmptyNavigationLink(destination: RepoDetailsView(inputRepo: selectedRepo, tapOnLinkAction: tapOnLinkAction), selectedItem: $selectedRepo)
            }
        }
        .fullScreenCover(isPresented: $isProfilePresented, content: {
            ProfileCoordinator(username: username)
        })
    }
    
    private func tapOnLinkAction(url: URL) {
        openURL(url)
    }
}
