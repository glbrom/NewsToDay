//
//  MainTabView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Constants.Icons.home
                }
            
            Categories()
                .tabItem {
                    Constants.Icons.categories
                }
            
            Bookmarks()
                .tabItem {
                    Constants.Icons.bookmark
                }
            
            Profile()
                .tabItem {
                    Constants.Icons.profile
                }
        }
    }
}

#Preview {
    MainTabView()
}
