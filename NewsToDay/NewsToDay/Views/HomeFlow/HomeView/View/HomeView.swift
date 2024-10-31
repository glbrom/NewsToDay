//
//  HomePage.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

@MainActor
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    @State var navigationArticle: SearchArticle?
    @State var navigateToDetail: Bool = false
    
    enum Layout {
        static let topTitle: LocalizedStringKey = "Browse"
        static let topDescription: LocalizedStringKey = "Discower things of this world"
    }
    
    var body: some View {
        VStack {
            TitleWithDescription(
                title: Layout.topTitle,
                description: Layout.topDescription
            )
            .padding(.top, 28)
            .padding(.bottom, 32)
            
            SearchView(
                searchQuery: $viewModel.searchQuery
            )
            .padding(.horizontal)
            .padding(.bottom, 24)
            
            ScrollView(.vertical) {
                // MARK: - Секция с выбором категории
                if viewModel.searchQuery.isEmpty {
                    CategoryCollectionView(
                        selectedCategory: $viewModel.selectedCategory
                    ) { category in
                        viewModel.getByCategory(with: category)
                    }
                    .padding(.horizontal)
                }
                
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .scaleEffect(2)
                        .padding()
                case .loaded:
                    /// Если триггерим поиск, включается другая коллекция
                    if viewModel.searchQuery.isEmpty {
                        /// Секция с новостями по категории
                        CategoryNewsCollectionView(
                            news: viewModel.news
                        ) { article in
                            //navigation to detail
                            navigationArticle = article
                            navigateToDetail = true
                        }
                        
                        RecomendedHeader {
                            //navigation to see all
                        }
                        
                        RecomnendedCollectionView(
                            recomendedNews: viewModel.recomendedNews,
                            category: viewModel.recomendedCategory
                        ) { article in
                            //navigation to detail
                            navigationArticle = article
                            navigateToDetail = true
                        }
                    } else {
                        /// Секция с новостями по поиску
                        SearchNewsCollectionView(
                            searchNews: viewModel.searchNews,
                            category: viewModel.selectedCategory
                        ) { article in
                            //navigation to detail
                            navigationArticle = article
                            navigateToDetail = true
                        }
                    }
                    
                    // TODO: Проверить обработку ошибок и добавить алерт
                case let .error(message):
                    Text(message)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            Spacer()
        }
        .background(
            Group {
                if let navigationArticle = navigationArticle {
                    NavigationLink(
                        "",
                        destination: DetailView(
                            article: navigationArticle,
                            category: viewModel.selectedCategory
                        ),
                        isActive: $navigateToDetail
                    )
                }
            }
        )
    }
}

#Preview {
    HomeView()
}
