//
//  BookmarkItem.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/23/24.
//
import SwiftUI

struct BookmarkItem: View {
    
    var image: String
    var category: String
    var title: String

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 96, height: 96)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(category)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .padding(.bottom, 8)
                Text(title)
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 14))
            }
            .padding(.horizontal,20)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    BookmarkItem(image: "city", category: "", title: "")
}
