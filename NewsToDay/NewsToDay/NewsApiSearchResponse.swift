//
//  NewsApiSearchResponse.swift
//  NewsToDay
//
//  Created by dsm 5e on 28.10.2024.
//

import Foundation

struct NewsAPISearchResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [SearchArticle]?
}

// MARK: - SearchArticle
struct SearchArticle: Codable, Hashable, Equatable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Identifiable
extension SearchArticle: Identifiable {
    var id: String  {
        return UUID().uuidString
    }
}

// MARK: - Для превью
extension SearchArticle {
    static let previewItem = SearchArticle(
        author: "Ryan Young",
        title: "World Series: Yankees fans called for interference after trying to rip glove off Mookie Betts’ hand in Game 4 - Yahoo Sports",
        description: "These Yankees fans certainly tried their best to stop Mookie Betts from making the out on Tuesday.",
        url: "https://sports.yahoo.com/world-series-yankees-fans-called-for-interference-after-trying-to-rip-glove-off-mookie-betts-hand-in-game-4-004406758.html",
        urlToImage: "https://s.yimg.com/ny/api/res/1.2/1c_Y_3Nk.W2kQ932xqB1Rw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2024-10/bb9881f0-9657-11ef-95ea-1660b7641101",
        publishedAt: "2024-10-30T02:16:00Z",
        content: "These Yankees fans certainly tried their best to stop Mookie Betts from making the out on Tuesday. (Al Bello/Getty Images)"
    )
}
