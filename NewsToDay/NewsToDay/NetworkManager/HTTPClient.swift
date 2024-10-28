//
//  HTTPClient.swift
//  NewsToDay
//
//  Created by dsm 5e on 28.10.2024.
//

import Foundation

enum ApiKeys: String, CaseIterable {
    case one

    var rawValue: String {
        switch self {
        case .one:
            return ProcessInfo.processInfo.environment["KEY_ONE"] ?? ""
        }
    }
}

// MARK: - Methods
enum HTTPMethod: String {
    case GET
}

//MARK: - Errors
enum HTTPClientError: Error, LocalizedError {
    case badURL
    case badDataTask
    case badParametrSerialization
    case badDecode
    case deadApiKey

    var errorDescription: String? {
        switch self {
        case .badURL:
            return "УРЛ не валидный."
        case .badDataTask:
            return "Запрос завершился с ошибкой."
        case .badParametrSerialization:
            return "Переданы неверные параметры."
        case .badDecode:
            return "Невозможно декодировать дату."
        case .deadApiKey:
            return "Смените апи ключ."
        }
    }
}

protocol HTTPClient {
    var apiKey: ApiKeys { get }
    var baseURL: String { get }
    var path: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }

    func request<T: Codable>(type: T.Type) async throws -> T
}

extension HTTPClient {
    func request<T: Codable>(type: T.Type) async throws -> T {
        guard let url = URL(string: baseURL + path + endpoint) else {
            throw HTTPClientError.badURL
        }
        print(url)

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .reloadIgnoringLocalCacheData

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("ResponseCode: \(httpResponse.statusCode)")
            switch httpResponse.statusCode {
            case 402:
                throw HTTPClientError.deadApiKey
            default:
                break
            }
        }

        do {
            let decodedData = try JSONDecoder().decode(type, from: data)
            return decodedData
        } catch {
            throw HTTPClientError.badDecode
        }
    }
}
