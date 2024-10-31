//
//  HomeViewModel.swift
//  NewsToDay
//
//  Created by dsm 5e on 28.10.2024.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    enum State {
        case loading
        case loaded
        case error(String)
    }

    @Published var state: State = .loading
    @Published var selectedCategory: Category = .business
    @Published var recomendedCategory: Category = .business
    @Published var news: [SearchArticle] = []
    @Published var recomendedNews: [SearchArticle] = []
    @Published var searchNews: [SearchArticle] = []
    @Published var searchQuery: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        getByCategory(with: selectedCategory)
        setupBindings()
    }

    func getByCategory(with category: Category) {
        state = .loading
        selectedCategory = category
        Task {
            do {
                /// Отправляем запрос на получение новостей по выбранной категории
                let byCategoryResponse = try await NetworkManager
                    .byCategory(category)
                    .request(type: NewsAPISearchResponse.self)
                /// Отправляем второй запрос на получение РЕКОМЕНДУЕМЫХ новостей по рандомной категории
                let recomendedCategory = Category.allCases.randomElement() ?? .technology
                let recomendedResponse = try await NetworkManager
                    .byCategory(recomendedCategory)
                    .request(type: NewsAPISearchResponse.self)
                
                self.news = byCategoryResponse.articles ?? []
                self.recomendedNews = recomendedResponse.articles?.shuffled() ?? []
                self.recomendedCategory = recomendedCategory
                
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
    
    private func setupBindings() {
        $searchQuery
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                guard !query.isEmpty else { return }
                self?.getNewsByQuery(query: query)
            }
            .store(in: &cancellables)
    }
}
