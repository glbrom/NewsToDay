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
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .cornerRadius(12)
                            .clipped()
                    case .failure(_):
                        Color.clear
                            .frame(width: 96, height: 96)
                            .cornerRadius(12)
                    case .empty:
                        Color.clear
                            .frame(width: 96, height: 96)
                            .cornerRadius(12)
                    @unknown default:
                        Color.clear
                            .frame(width: 96, height: 96)
                            .cornerRadius(12)
                    }
                }
            } else {
                Color.clear
                    .frame(width: 96, height: 96)
                    .cornerRadius(12)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.category ?? "")
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .padding(.top, 4)
                
                Text(article.title ?? "NO title")
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.top, 6)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

#Preview {
    BookmarkItem(article: SearchArticle(
        author: "Author",
        title: "Sample Title",
        description: "Description",
        url: "https://example.com",
        urlToImage: "https://s.yimg.com/ny/api/res/1.2/1c_Y_3Nk.W2kQ932xqB1Rw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2024-10/bb9881f0-9657-11ef-95ea-1660b7641101",
        publishedAt: "2024-11-01",
        content: "Sample content",
        category: "Technology"
    ))
}
