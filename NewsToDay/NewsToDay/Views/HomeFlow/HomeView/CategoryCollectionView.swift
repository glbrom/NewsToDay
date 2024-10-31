//
//  CategoryCollectionView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct CategoryCollectionView: View {
    
    @Binding var selectedCategory: Category
    var onTapGesture: ((Category) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Category.allCases) { category in
                    Text(category.rawValue)
                        .foregroundStyle(
                            selectedCategory == category
                            ? .white
                            : .greyPrimary
                        )
                        .padding(.vertical, 6)
                        .padding(.horizontal)
                        .background(
                            selectedCategory == category
                            ? .purplePrimary
                            : .greyLighter
                        )
                        .clipShape(Capsule())
                        .onTapGesture {
                            onTapGesture?(category)
                        }
                }
            }
        }
        .padding(.bottom, 24)
    }
}

#Preview {
    CategoryCollectionView(selectedCategory: .constant(.business))
}
