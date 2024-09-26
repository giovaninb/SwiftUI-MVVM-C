//
//  GithubRouter.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import Foundation

enum GithubRouter: RequestInfoConvertible {
    
    case repos(username: String)
    case repo(username: String, name: String)
    case user(username: String)
    
    var endpoint: String {
        "https://api.github.com"
    }
    
    var path: String {
        switch self {
        case.repos(let username):
            return "users/\(username)/repos"
        case .repo(let username, name: let name):
            return "repos/\(username)/\(name)"
        case .user(let username):
            return "users/\(username)"
        }
    }
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString)
        
        return requestInfo
    }
    
    
}
