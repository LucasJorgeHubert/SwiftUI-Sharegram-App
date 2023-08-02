//
//  MainTabView.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/05/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // MARK: - Feed View
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            // MARK: - Search View
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            // MARK: - Upload Post
            Text("UploadPost")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            // MARK: - Notification
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            // MARK: - Profile View
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.purple)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
