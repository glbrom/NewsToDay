//
//  LocalizationManager.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/27/24.
//

import SwiftUI

// MARK: - Language Enum
enum Language: String, CaseIterable, Codable, Identifiable {
    var id: String { self.rawValue }
    case ru = "ru"  // Russian
    case en = "en"  // English
}

// MARK: - LocalizationService
class LocalizationManager: ObservableObject {
    
    // MARK: - Properties
    // Singleton instance of LocalizationService
    public static let shared = LocalizationManager()
    
    // The currently selected language
    var language: Language {
        get {
            // Retrieves the selected language from UserDefaults, or defaults to English if not set
            guard let languageString = UserDefaults.standard.string(forKey: "selectedLanguage") else {
                saveLanguage(.en)
                return .en
            }
            
            // Returns the stored language or defaults to English if the value is invalid
            return Language(rawValue: languageString) ?? .en
        }
        set {
            // Updates the language if it has changed
            if newValue != language {
                saveLanguage(newValue)
            }
        }
    }
    
    // MARK: - Init
     init() { }
    
    // MARK: - Methods
    // Saves the selected language to UserDefaults and updates the system language setting
     func saveLanguage(_ language: Language) {
        UserDefaults.standard.setValue(language.rawValue, forKey: "selectedLanguage")
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
    }
}
