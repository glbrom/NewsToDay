//
//  CategoryNewsCollectionView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct CategoryNewsCollectionView: View {
    var news: [SearchArticle]
    var onDetail: ((SearchArticle) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(news) { article in
                    ZStack {
                        if let url = URL(string: article.urlToImage ?? "") {
                            AsyncImage(url: url) { img in
                                img
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ZStack {
                                    ProgressView()
                                    Color.purpleLight
                                }
                            }
                            .frame(width: 256, height: 256)
                        }
                        
                        VStack {
                            Text(article.title ?? "")
                                .bold()
                                .foregroundStyle(.white)
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
        .padding(.horizontal)
    }
}

#Preview {
    CategoryNewsCollectionView(news: [])
}
