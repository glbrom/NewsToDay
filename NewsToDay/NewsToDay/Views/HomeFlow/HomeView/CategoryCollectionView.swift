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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 10) {
                ForEach(Category.allCases) { category in
                    Text(category.rawValue)
                        .font(.interFont(.semiBold, size: 14))
                        .foregroundStyle(
                            selectedCategory == category
                            ? .white
                            : .greyPrimary
                        )
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(
                            selectedCategory == category
                            ? .purplePrimary
                            : .greyLighter
                        )
                        .cornerRadius(16)
                        .onTapGesture {
                            onTapGesture?(category)
                        }
                }
            }
        }
    }
}

#Preview {
    CategoryCollectionView(selectedCategory: .constant(.business))
}
