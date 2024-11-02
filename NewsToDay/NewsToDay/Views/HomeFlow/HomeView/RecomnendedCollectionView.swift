//
//  RecomnendedCollectionView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct RecomnendedCollectionView: View {
    var recomendedNews: [SearchArticle]
    var category: Category
    var onDetail: ((SearchArticle) -> Void)?
    
    var body: some View {
        VStack {
            ForEach(recomendedNews) { article in
                RecomendedItem(
                    article: article,
                    category: category
                )
                .equatable()
                .onTapGesture {
                    onDetail?(article)
                }
            }
        }
    }
}
