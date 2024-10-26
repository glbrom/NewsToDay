//
//  Constants.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

enum Constants {
 
    enum Colors {
        static let blackDark = Color(.blackDark)
        static let blackLight = Color(.blackLight)
        static let blackLighter = Color(.blackLighter)
        static let blackPrimary = Color(.blackPrimary)
        static let greyDark = Color(.greyDark)
        static let greyLight = Color(.greyLight)
        static let greyLighter = Color(.greyLighter)
        static let greyPrimary = Color(.greyPrimary)
        static let purpleDarker = Color(.purpleDarker)
        static let purpleLight = Color(.purpleLight)
        static let purpleLighter = Color(.purpleLighter)
        static let purplePrimary = Color(.purplePrimary)
    }
    
    enum IconsEmojiCategories: LocalizedStringKey {
        case sports = "🏈 Sports"
        case politics = "⚖️ Politics"
        case life = "🌞 Life"
        case gaming = "🎮 Gaming"
        case animals = "🐻 Animals"
        case nature = "🌴 Nature"
        case food = "🍔 Food"
        case art = "🎨 Art"
        case history = "📜 History"
        case fashion = "👗 Fashion"
        case covid19 = "😷 Covid-19"
        case middleEast = "⚔️ Middle East"
    }
    
    static let buttonArray: [[IconsEmojiCategories]] = [
            [.sports, .politics],
            [.life, .gaming],
            [.animals, .nature],
            [.food, .art],
            [.history, .fashion],
            [.covid19, .middleEast]
        ]
    
    enum Icons {
        static let search = Image("Search")
        static let home =  Image("Home")
        static let categories = Image("Categories")
        static let bookmark = Image("Bookmarks")
        static let bookmarkOn = Image(systemName: "bookmark.fill")
        static let bookmarkWhite = Image("BookmarksWhite")
        static let bookmarkEmpty = Image("BookmarksEmpty")
        static let profile = Image("Profile")
        static let signOut = Image("LogOut")
        static let shared = Image("Shared")
        static let leftArrow = Image("ArrowLeft")
        static let leftArrowWhite = Image("ArrowLeftWhite")
        static let rightArrow = Image("ArrowRight")
        static let checkMark = Image("Checkmark")
        static let envelope = Image("envelope")
        static let padlock = Image("padlock")
    }
    
    enum Backgrounds {
        static let whiteBackground = Color.white
        static let darkBlueBackground = Color(.purpleDarker)
    }
    
}
