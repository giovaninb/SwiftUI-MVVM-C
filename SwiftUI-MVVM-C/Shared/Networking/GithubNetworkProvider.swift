//
//  GithubNetworkProvider.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import Foundation
import Combine

protocol GithubNetworkProvider {
    func getRepos(username: String) -> AnyPublisher<[Repo], Error>
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, Error>
    func getUser(username: String) -> AnyPublisher<User, Error>
}

class GithubNetworkClient: GithubNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getRepos(username: String) -> AnyPublisher<[Repo], any Error> {
        networkClient.request(GithubRouter.repos(username: username)).decode()
    }
    
    func getRepo(username: String, name: String) -> AnyPublisher<Repo, any Error> {
        networkClient.request(GithubRouter.repo(username: username, name: name)).decode()
    }
    
    func getUser(username: String) -> AnyPublisher<User, any Error> {
        networkClient.request(GithubRouter.user(username: username)).decode()
    }
    
}
