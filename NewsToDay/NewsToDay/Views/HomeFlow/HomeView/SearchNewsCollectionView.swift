//
//  SearchNewsCollectionView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct SearchNewsCollectionView: View {
    
    var searchNews: [SearchArticle]
    var category: Category
    var onDetail: ((SearchArticle) -> Void)?
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if searchNews.isEmpty {
                    Text("По вашему запросу нет результатов")
                        .font(.interFont(.medium, size: 16))
                        .foregroundStyle(.greyPrimary)
                        .padding()
                }
                ForEach(searchNews, id: \.self) { article in
                    RecomendedItem(
                        article: article,
                        category: category
                    )
                    .onTapGesture {
                        onDetail?(article)
                    }
                }
            }
        }
    }
}

#Preview {
    SearchNewsCollectionView(searchNews: [], category: .business)
}
