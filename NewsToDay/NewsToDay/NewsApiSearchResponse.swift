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
