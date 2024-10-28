//
//  HomePageViewModel.swift
//  NewsToDay
//
//  Created by dsm 5e on 28.10.2024.
//

import Foundation
import Combine

@MainActor
final class HomePageViewModel: ObservableObject {
    enum State {
        case loading
        case loaded
        case error(String)
    }

    @Published var searchQuery: String = ""
    @Published var state: State = .loading
    @Published var selectedCategory: Category = .general
    @Published var news: [CategoryArticle] = []
    @Published var searchNews: [SearchArticle] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        getByCategory(with: .general)

        $searchQuery
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                guard !query.isEmpty else { return }
                self?.getNewsByQuery(query: query)
            }
            .store(in: &cancellables)
    }

    func getByCategory(with category: Category) {
        state = .loading
        Task {
            do {
                let response = try await NetworkManager
                    .byCategory(category)
                    .request(type: NewsAPICategoryResponse.self)

                self.news = response.sources ?? []
                self.selectedCategory = category
                state = .loaded
            } catch {
                print("Error fetching news: \(error)")
                state = .error("Error fetching news: \(error.localizedDescription)")
            }
        }
    }

    func getNewsByQuery(query: String) {
        state = .loading
        Task {
            do {
                let response = try await NetworkManager
                    .search(query)
                    .request(type: NewsAPISearchResponse.self)

                self.searchNews = response.articles ?? []
                state = .loaded
            } catch {
                print("Error fetching news: \(error)")
                state = .error("Error fetching news: \(error.localizedDescription)")
            }
        }
    }
}
