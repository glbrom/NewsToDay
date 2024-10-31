//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import Foundation

// MARK: - NewsApi Service
enum NetworkManager {
    case search(String)
    case byCategory(Category)
}

extension NetworkManager: HTTPClient {
    var apiKey: ApiKeys {
        return .one
    }
    
    var baseURL: String {
        return "https://newsapi.org/v2/"
    }
    
    var path: String {
        switch self {
        case .search:
            return "everything?q="
        case .byCategory:
            return "top-headlines?category="
        }
    }
    
    var endpoint: String {
        switch self {
        case let .search(query):
            return query
        case let .byCategory(category):
            return category.rawValue
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var headers: [String : String]? {
        [
            "Content-type": "application/json",
            "x-api-key": apiKey.rawValue
        ]
    }
}
