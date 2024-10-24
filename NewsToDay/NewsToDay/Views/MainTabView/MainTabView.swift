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
                
                .tag(0)
            
            Categories()
                .tabItem {
                    Constants.Icons.categories
                }
                
                .tag(1)
            
            Bookmarks()
                .tabItem {
                    Constants.Icons.bookmark
                }
                
                .tag(2)
            
            Profile()
                .tabItem {
                    Constants.Icons.profile
                }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
