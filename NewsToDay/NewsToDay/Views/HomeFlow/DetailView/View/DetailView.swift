//
//  DetailView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct DetailView: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    var  storageManager = StorageManager.shared
   @State  var isBookmarked: Bool = false
    var article: SearchArticle
    var category: Category
    
    var body: some View {
// MARK: - Button for saving
//        Button(action:{
//            isBookmarked = true
//            if isBookmarked {
//                Task {
//                    try await storageManager.saveArticle(article, category: category)
//                }
//            }
//        })
//        {
//            Constants.Icons.bookmarkWhite
//                .resizable()
//                .frame(width: 42, height:  42)
//                .background(Color.green)
//            
//        }
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
