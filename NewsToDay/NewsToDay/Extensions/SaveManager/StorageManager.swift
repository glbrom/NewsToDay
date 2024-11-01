//
//  SaveManager.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/26/24.
//

import Foundation
import FirebaseFirestore

final class StorageManager {
    // MARK: - Properties
    public static let shared = StorageManager()
    private let db = Firestore.firestore()
    private let userDefaults = UserDefaults.standard
    
    enum UserDefaultKeys {
        static let savedUsername = "savedUsername"
    }
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Functions
    func saveUsername(_ username: String) {
           userDefaults.set(username, forKey: UserDefaultKeys.savedUsername)
       }

       func getUsername() -> String? {
           userDefaults.string(forKey: UserDefaultKeys.savedUsername)
       }
       
       func isUsernameTaken(_ username: String) -> Bool {
           return getUsername() == username
       }
    
   //MARK: - Saving Bookmark through Firestore
    func saveArticle(_ article: SearchArticle, category: Category) async throws {
           let documentData: [String: Any] = [
               "author": article.author ?? "",
               "title": article.title ?? "",
               "description": article.description ?? "",
               "url": article.url ?? "",
               "urlToImage": article.urlToImage ?? "",
               "publishedAt": article.publishedAt ?? "",
               "content": article.content ?? "",
               "category": category.rawValue
           ]
           
           try await db.collection("articles").document(article.id).setData(documentData)
       }
    // Fetching articles through firestore
    func fetchArticles() async throws -> [SearchArticle] {
           let snapshot = try await db.collection("articles").getDocuments()
           
           return snapshot.documents.compactMap { document in
               try? document.data(as: SearchArticle.self)
           }
       }
    
   }



