//
//  RepoListViewModel.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import Foundation

class RepoListViewModel: ObservableObject {
    @Published var repos: [Repo] = []
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    func getRepos() {
        networkClient
            .getRepos(username: "giovaninb")
            .replaceError(with: [])
            .assign(to: &$repos)
    }
}
