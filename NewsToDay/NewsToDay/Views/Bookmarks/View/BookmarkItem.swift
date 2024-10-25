//
//  BookmarkItem.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/23/24.
//

import SwiftUI

struct BookmarkItem: View {
    // MARK: - Properties
    var image: String
    var category: String
    var title: String
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 16) {
            Image(image)
                .resizable()
                .frame(width: 96, height: 96)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(category)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                Text(title)
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    BookmarkItem(image: "city", category: "Category", title: "Title")
}
