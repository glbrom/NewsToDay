//
//  CategoriesFavoriteTopics.swift
//  NewsToDay
//
//  Created by Roman Golub on 25.10.2024.
//

import SwiftUI

struct CategoriesFavoriteTopics: View {
    // MARK: - Properties
    @State private var isMainTabViewActive = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                TitleWithDescription(title: "Select your favorite topics", description: "Select some of your favorite topics to let us suggest better news for you.")
                    .padding(.top, 28)
                
                ScrollView {
                    CategoriesButtons(unselectedColor: Constants.Colors.greyLighter)
                        .padding(.top, 32)
                }
                
                ActionButtonView(buttonText: "Next", action: { isMainTabViewActive = true}, action2: {})
                    .padding(.bottom, 16)
            }
            .background(
                Group {
                    NavigationLink(
                        destination: MainTabView(),
                        isActive: $isMainTabViewActive,
                        label: { EmptyView() }
                    )
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        //        .fullScreenCover(isPresented: $isMainTabViewActive, content: {
        //            MainTabView()
        //        })
    }
}

#Preview {
    CategoriesFavoriteTopics()
}
