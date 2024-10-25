//
//  Categories.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct Categories: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            TitleWithDescription(title: "Categories", description: "Thousands of articles in each category")
                .padding(.top, 28)
            
            ScrollView {
                CategoriesButtons()
                    .padding(.top, 32)
            }
        }
    }
}

#Preview {
    Categories()
}
