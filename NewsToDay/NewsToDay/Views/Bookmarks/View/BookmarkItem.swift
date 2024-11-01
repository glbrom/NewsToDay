//
//  BookmarkItem.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/23/24.
//

import SwiftUI

struct BookmarkItem: View {
    // MARK: - Properties
    var article: SearchArticle
    // MARK: - Body
    var body: some View {
        HStack(spacing: 16) {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 96, height: 96)
                                    .cornerRadius(12)
                            } placeholder: {
                                Color.gray
                                    .frame(width: 96, height: 96)
                                    .cornerRadius(12)
                            }
                        }
            VStack(alignment: .leading) {
                Text(article.category ?? "")
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                Text(article.title ?? "NO title")
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    BookmarkItem(article: SearchArticle(
           author: "Author",
           title: "Sample Title",
           description: "Description",
           url: "https://example.com",
           urlToImage: "https://example.com/image.jpg",
           publishedAt: "2024-11-01",
           content: "Sample content",
           category: "Technology"
       ))
}
