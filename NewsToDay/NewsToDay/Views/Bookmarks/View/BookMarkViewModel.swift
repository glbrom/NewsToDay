//
//  BookMarkViewModel.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 11/1/24.
//
import Foundation
import SwiftUI
import FirebaseFirestore

class BookMarkViewModel: ObservableObject {
    var db: Firestore { Firestore.firestore() }
      var storageManager = StorageManager.shared

    @Published var isBookmarked: Bool = false
    @Published var articles: [SearchArticle] = []
    @Published  var boookMarkTitle: LocalizedStringKey = "Bookmarks"
    @Published  var articleDescription: LocalizedStringKey = "Saved articles to the library"
    @Published var noSavedMessage: LocalizedStringKey = "You haven't saved any articles yet. Start reading and bookmarking them now"

      init() {
          fetchBookmarks()
      }
      
      func fetchBookmarks() {
          Task {
              do {
                  let fetchedArticles = try await storageManager.fetchArticles()
                  DispatchQueue.main.async {
                      self.articles = fetchedArticles
                  }
              } catch {
                  print("Error fetching articles: \(error)")
              }
          }
      }
    
}
