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
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.regular, size: 14))
                    .padding(.top, 4)
                
                Text(title )
                    .foregroundColor(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.top, 6)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

#Preview {
    BookmarkItem(image: "city", category: "Category", title: "Title")
}
