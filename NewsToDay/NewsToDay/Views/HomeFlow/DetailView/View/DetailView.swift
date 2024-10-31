//
//  DetailView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct DetailView: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language

    var article: SearchArticle
    var category: Category
    
    var body: some View {
        VStack {
            ZStack {
                if let url = URL(string: article.urlToImage ?? "") {
                    AsyncImage(url: url) { img in
                        img
                            .resizable()
                    } placeholder: {
                        ZStack {
                            ProgressView()
                            Color.purpleLight
                        }
                    }
                    .frame(height: 384)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.purpleLight)
                        .frame(height: 384)
                }
                
                
                VStack {
                    Spacer()
                    Text(category.rawValue)
                        .padding(.vertical, 6)
                        .padding(.horizontal)
                        .background(.purplePrimary)
                        .clipShape(Capsule())
                    Text(article.author ?? "")
                    Text("Author")
                }
                .padding()
            }

            VStack {
                Text("Results")
                    .font(.headline)
                    .bold()
                
                Text(article.description ?? "")
                    .font(.subheadline)
            }
        }
    }
}
