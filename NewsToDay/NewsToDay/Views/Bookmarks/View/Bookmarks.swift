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
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    private let storageManager = StorageManager.shared
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
    @ObservedObject var viewModel = BookMarkViewModel()
    
    // MARK: - Body
       
    var body: some View {
      
        VStack {
            
            TitleWithDescription(title: viewModel.boookMarkTitle, description: viewModel.articleDescription)
                .padding(.top, 28)
            if viewModel.articles.isEmpty {
                
            }
            
            VStack {
                if storageManager.isSaved {
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
                            ForEach(viewModel.articles) { article in
                                BookmarkItem(article: article)
                            }
                        }
                        
                    }
                }
                
                
                Spacer()
            }
            .padding(.top, 32)
            Spacer()
        }
        .padding(.horizontal,20)
                .onAppear {
                        viewModel.fetchBookmarks()
        }
    }
}

#Preview {
    Bookmarks()
}
