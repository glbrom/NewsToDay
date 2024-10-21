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
    
    enum IconsEmojiCategories {
        static let sports = Image("🏈")
        static let politics = Image("⚖️")
        static let life = Image("🌞")
        static let gaming = Image("🎮")
        static let animals = Image("🐻")
        static let nature = Image("🌴")
        static let food = Image("🌴")
        static let art = Image("🎨")
        static let history = Image("📜")
        static let fashion = Image("👗")
    }
    
    enum Icons {
        static let search = Image("")
        static let home =  Image(systemName: "house")
        static let categories = Image(systemName: "square.grid.2x2")
        static let bookmark = Image(systemName: "bookmark")
        static let bookmarkOn = Image(systemName: "bookmark.fill")
        static let profile = Image(systemName: "person")
        static let signOut = Image("")
        static let shared = Image("")
        static let leftArrow = Image("")
        static let rightArrow = Image("")
        static let checkMark = Image("")
    }
    
    enum Backgrounds {
        static let whiteBackground = Color.white
        static let darkBlueBackground = Color(.purpleDarker)
    }
    
}
