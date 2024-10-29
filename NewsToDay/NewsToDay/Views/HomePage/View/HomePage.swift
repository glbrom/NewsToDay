//
//  HomePage.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI
import Combine

@MainActor
struct HomePage: View {
    @StateObject private var viewModel = HomePageViewModel()
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language

    var body: some View {
        VStack {
            TextField("Search", text: $viewModel.searchQuery)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .scaleEffect(2)
                    .padding()
            case .loaded:
                // MARK: - Если включен поиск, включается другая коллекция
                if viewModel.searchQuery.isEmpty {
                    // MARK: - Секция с выбором категории
                    ScrollView {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(Category.allCases) { category in
                                    Text(category.rawValue)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .background(viewModel.selectedCategory == category ? .gray : .greyLight)
                                        .onTapGesture {
                                            viewModel.getByCategory(with: category)
                                        }
                                }
                            }
                        }
                        
                        // MARK: - Секция с новостями
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.news, id: \.self) { new in
                                    ZStack {
                                        if let url = URL(string: new.url ?? "") {
                                            AsyncImage(url: url) { img in
                                                img
                                                    .resizable()
                                            } placeholder: {
                                                ZStack {
                                                    ProgressView()
                                                    Color.gray
                                                }
                                            }
                                        }
                                        
                                        VStack {
                                            Text(new.description ?? "")
                                            Text("url: \(new.name)")
                                        }
                                    }
                                    .frame(width: 256, height: 256)
                                }
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(viewModel.searchNews, id: \.self) { news in
                                Text(news.title ?? "")
                                    .padding()
                            }
                        }
                    }
                }
           
            case let .error(message):
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomePage()
}
