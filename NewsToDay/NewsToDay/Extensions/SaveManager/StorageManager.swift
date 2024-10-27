//
//  SaveManager.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/26/24.
//

import Foundation
final class StorageManager {
    // MARK: - Properties
    public static let shared = StorageManager()
    private let userDefaults = UserDefaults.standard
    
    enum UserDefaultKeys {
        static let savedUsername = "savedUsername"
        static let savedBookmark = "savedBookmarks"
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
   }
