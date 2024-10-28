//
//  MainTabView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    // MARK: - Body
    var body: some View {
        NavigationView{
            ZStack {
                TabView(selection: $selectedTab) {
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
                    
                    ProfileView(viewModel: RegisterViewModel())
                        .tabItem {
                            Constants.Icons.profile
                        }
                        .tag(3)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .accentColor(Constants.Colors.purplePrimary)
                
                VStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Constants.Colors.greyLighter, lineWidth: 2)
                        .frame(height: 96)
                        .background(Color.clear)
                }
                .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainTabView()
}
