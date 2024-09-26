//
//  ProfileCoordinator.swift
//  SwiftUI-MVVM-C
//
//  Created by Giovani Bettoni on 25/09/24.
//

import SwiftUI

struct ProfileCoordinator: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    let username: String
    
    var body: some View {
        NavigationView {
            ProfileView(username: username, tapOnLinkAction: { url in
                openURL(url)
            })
            .navigationBarItems(leading: Button("Close", action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}
