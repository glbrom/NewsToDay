//
//  CategoryNewsCollectionView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct CategoryNewsCollectionView: View {
    @State private var isBookmarked: Bool = false
    var news: [SearchArticle]
    var onDetail: ((SearchArticle) -> Void)?
    var category: Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(news) { article in
                    ZStack {
                        ArticleImageView(url: article.urlToImage, scaleEffect: 1)
                            .frame(width: 256, height: 256)
                            .cornerRadius(12)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button {
                                    isBookmarked.toggle()
                                } label: {
                                    (isBookmarked ? Constants.Icons.bookmarkWhite : Constants.Icons.bookmarkWhite)
                                        .renderingMode(.template)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(isBookmarked ? .purplePrimary : .white)
                                        .padding(EdgeInsets(top: 24, leading: 208, bottom: 0, trailing: 24))
                                }
                                .contentShape(Rectangle())
//                                Constants.Icons.bookmarkWhite
//                                    .renderingMode(.template)
//                                    .frame(width: 24, height: 24)
//                                    .foregroundColor(.white)
//                                    .padding(EdgeInsets(top: 24, leading: 208, bottom: 0, trailing: 24))
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(alignment: .leading) {
                                Text(category.rawValue)
                                    .foregroundColor(.greyLighter)
                                    .font(.interFont(.regular, size: 12))
                                    .frame(width: 120, alignment: .leading)
                                    .textCase(.uppercase)
                                    .padding(EdgeInsets(top: 112, leading: 24, bottom: 0, trailing: 112))
                                
                                Text(article.title ?? "")
                                    .foregroundColor(.white)
                                    .font(.interFont(.bold, size: 16))
                                    .frame(width: 208, alignment: .bottomLeading)
                                    .lineLimit(2)
                                    .truncationMode(.tail)
                                    .padding(EdgeInsets(top: 2, leading: 24, bottom: 24, trailing: 24))
                            }
                        }
                    }
                    .cornerRadius(12)
                    .frame(width: 256, height: 256)
                    .onTapGesture {
                        onDetail?(article)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CategoryNewsCollectionView(news: [SearchArticle.previewItem], category: .business)
}
