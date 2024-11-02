//
//  DetailView.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    @AppStorage("isBookmarked") private var isBookmarked: Bool = false
    private let storageManager = StorageManager.shared
    
    var article: SearchArticle
    var category: Category
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    ImageDetailView(article: article)
                    
                    VStack(alignment: .leading) {
                        /// Category
                        Text(category.rawValue)
                            .font(.interFont(.semiBold, size: 12))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(.purplePrimary)
                            .cornerRadius(16)
                            .padding(.top, 174)
                        
                        /// Tittle
                        Text(article.title ?? "")
                            .font(.interFont(.bold, size: 20))
                            .frame(width: 336, height: 100, alignment: .leading)
                            .foregroundColor(.greyLighter)
                            .padding(.top, 16)
                            .padding(.trailing, 20)
                        
                        /// Autor
                        if let autor = article.author {
                            Text(autor)
                                .font(.interFont(.semiBold, size: 16))
                                .foregroundColor(.white)
                                .padding(.top, 24)
                                .padding(.leading, 6)
                        }
                        
                        Text("Autor")
                            .font(.interFont(.regular, size: 14))
                            .foregroundColor(.greyLight)
                            .padding(.top, -2)
                            .padding(.leading, 6)
                            .padding(.bottom, 24)
                        
                        /// Results
                        Text("Results")
                            .font(.interFont(.semiBold, size: 16))
                            .foregroundColor(.blackPrimary)
                            .padding(.top, 24)
                        
                        /// Description
                        Text(article.description ?? "")
                            .font(.interFont(.regular, size: 16))
                            .foregroundColor(.greyDark)
                            .padding(.top, 2)
                            .padding(.trailing, 20)
                        
                    }
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
            // Buttons
            HStack(alignment: .top) {
                // BackButton
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Constants.Icons.leftArrowWhite
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                
                VStack {
                    // BookmarksButton
                    Button {
                        isBookmarked.toggle()
                //  BookMarkAction
                        Task {
                    if isBookmarked {
                
            do {
                try await storageManager.saveArticle(article, category: category)
            print("Article saved successfully.")
            } catch {
        print("Failed to save article: \(error)")
            }
            } else {
        // Remove BookMark
            do {
            try await storageManager.removeArticle(article)
            print("Article removed successfully.")
            } catch {
        print("Failed to remove article: \(error)")
            }
        }
    }
                    } label: {
                        (isBookmarked ? Constants.Icons.bookmarkWhite : Constants.Icons.bookmarkWhite)
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundColor(isBookmarked ? .purplePrimary : .white)
                    }
                    
                    // SharedButton
                    Button {
                        //
                    } label: {
                        Constants.Icons.shared
                            .frame(width: 24, height: 24)
                            .padding(.top, 12)
                    }
                    
                }
                .padding(.trailing, 24)
            }
            .padding(.top, 18)
        }
    }
}

#Preview {
    DetailView(article: SearchArticle.previewItem, category: .business)
}
