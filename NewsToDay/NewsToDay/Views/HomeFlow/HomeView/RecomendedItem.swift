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
            ArticleImageView(url: article.urlToImage)
                .frame(width: 96, height: 96)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category.rawValue)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .padding(.top, 4)
                
                Text(article.title ?? "")
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.top, 6)
            }
            .frame(width: 234, alignment: .leading)
            .padding(.trailing, 20)
        }
        //        .padding(.vertical, 4)
    }
}

struct ArticleImageView: View {
    var url: String?
    var scaleEffect: CGFloat = 1
    
    var body: some View {
        if let urlString = url, let imageUrl = URL(string: urlString) {
            AsyncImage(url: imageUrl) { img in
                img
                    .resizable()
                    .scaledToFill()
                    .applyGradient()
            } placeholder: {
                DefaultImageView(scaleEffect: scaleEffect)
                    .applyGradient()
            }
        } else {
            DefaultImageView(scaleEffect: scaleEffect)
                .applyGradient()
        }
    }
}

#Preview {
    RecomendedItem(article: SearchArticle.previewItem, category: .business)
}
