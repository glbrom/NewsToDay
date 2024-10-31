//
//  RecomendedItem.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct RecomendedItem: View, Equatable {
    var article: SearchArticle
    var category: Category
    
    var body: some View {
        HStack(spacing: 16) {
            if let url = URL(string: article.urlToImage ?? "") {
                AsyncImage(url: url) { img in
                    img
                        .resizable()
                } placeholder: {
                    ZStack {
                        ProgressView()
                        Color.purpleLight
                    }
                }
                .cornerRadius(12)
                .frame(width: 96, height: 96)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.purpleLight)
                    .frame(width: 96, height: 96)
            }
            
            VStack(alignment: .leading) {
                Text(category.rawValue)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                Text(article.title ?? "")
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    RecomendedItem(article: SearchArticle.previewItem, category: .business)
}
