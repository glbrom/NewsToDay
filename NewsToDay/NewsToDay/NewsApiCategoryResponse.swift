//
//  NewsApiResponse.swift
//  NewsToDay
//
//  Created by dsm 5e on 28.10.2024.
//

import Foundation

// MARK: - NewsAPIResponse
struct NewsAPICategoryResponse: Codable {
    let status: String?
    let sources: [CategoryArticle]?
}

// MARK: - Source
struct CategoryArticle: Identifiable, Codable, Hashable {
    let id: String?
    let name, description: String?
    let url: String?
    let category: Category?
    let language, country: String?
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}

extension Category {
    var id: String  {
        return self.rawValue
    }
}
