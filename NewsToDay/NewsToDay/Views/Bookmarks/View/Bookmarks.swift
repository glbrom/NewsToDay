//
//  BookmarkItem.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/23/24.
//

import SwiftUI
struct Bookmarks: View {
    // MARK: - Properties
    var selectedTab = 2
    @State var isActive: Bool = false
    @State var isSaved: Bool = true
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    var mainImage: String = "city"
    var boookMarktext: LocalizedStringKey = "Bookmarks"
    var article: LocalizedStringKey = "Saved articles to the library"
    var bullet: String = "UI/UX Design"
    var topic : String = "A Simple Trick For Creating Color Palettes Quickly"
    var topic2 : String = "Six steps to creating a color pallete"
    var topic3 : String = "Creating Color Palette from world around you"
    var bullet3: String = "Colors"
    var bullet2: String = "Art"
    var notSaved: LocalizedStringKey = "You haven't saved any articles yet. Start reading and bookmarking them now"
    
    // MARK: - Body
    var body: some View {
      
        VStack {
            
            TitleWithDescription(title: boookMarktext, description: article)
                .padding(.top, 28)
            
            VStack {
                if !isSaved {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(.purpleLighter)
                            Constants.Icons.bookmarkEmpty
                        }
                        .frame(width: 72, height: 72)
                        .padding(.top,150)
                        
                        Text(notSaved)
                            .foregroundColor(.blackPrimary)
                            .font(.interFont(.medium, size: 16))
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .frame(width:256, height: 72)
                            .padding(.top, 24)
                        
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    ScrollView {
                        VStack {
                            BookmarkItem(image: mainImage, category: bullet, title: topic)
                            BookmarkItem(image: mainImage, category: bullet2, title: topic2)
                            BookmarkItem(image: mainImage, category: bullet3, title: topic3)
                            BookmarkItem(image: mainImage, category: bullet, title: topic)
                        }
                    }
                }
            }
            .padding(.top, 32)
            
            Spacer()
        }
    }
}

#Preview {
    Bookmarks()
}
