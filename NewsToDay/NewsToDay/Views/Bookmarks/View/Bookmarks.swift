import SwiftUI

struct Bookmarks: View {
    var selectedTab = 2
    @State var isActive: Bool = false
    @State var isSaved: Bool = false
    var mainImage: String = "city"
    var boookMarktext: String = "Bookmarks"
    var article: String = "Saved articles to the library"
    var bullet: String = "UI/UX Design"
    var topic : String = "A Simple Trick For Creating\n Color Palettes Quickly"
    var topic2 : String = "Six steps to creating a color\n pallete"
    var topic3 : String = "Creating Color Palette from world around you"
    var bullet3: String = "Colors"
    var bullet2: String = "Art"
    var notSaved: String = "You haven't saved any articles yet. Start reading and bookmarking them now"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(boookMarktext)
                .font(.interFont(.bold, size: 24))
                .fontWeight(.bold)
                .padding(.top, 72)
                .padding(.horizontal, 20)
            
            Text(article)
                .font(.interFont(.bold, size: 16))
                .foregroundColor(.greyPrimary)
                .padding(.top,8)
                .padding(.horizontal, 20)
            
           
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
                        .font(.interFont(.medium, size: 19))
                        .multilineTextAlignment(.center)
                        .frame(width:256, height: 72)
                        .padding(.top, 24)
                }
                .frame(maxWidth: .infinity)
            }else {
                VStack(alignment: .leading) {
                    BookmarkItem(image: mainImage, category: bullet, title: topic)
                    BookmarkItem(image: mainImage, category: bullet2, title: topic2)
                    BookmarkItem(image: mainImage, category: bullet3, title: topic3)
                    BookmarkItem(image: mainImage, category: bullet, title: topic)
                }
                .padding()
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .overlay(
            VStack {
                Spacer()
                MainTabView()
                    .frame(height: 96)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 0.1)
                    )
                    .ignoresSafeArea(edges: .bottom)
            }
        )
    }
}

#Preview {
    Bookmarks()
}
