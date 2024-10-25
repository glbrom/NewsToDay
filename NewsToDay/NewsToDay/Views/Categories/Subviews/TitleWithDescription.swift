//
//  TitleWithDescription.swift
//  NewsToDay
//
//  Created by Roman Golub on 25.10.2024.
//

import SwiftUI

struct TitleWithDescription: View {
    // MARK: - Properties
    var title: LocalizedStringKey
    var description: LocalizedStringKey
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.interFont(.semiBold, size: 24))
                .foregroundColor(.black)
                .frame(width: 336, alignment: .topLeading)
            
            Text(description)
                .font(.interFont(.regular, size: 16))
                .foregroundColor(.gray)
                .frame(width: 336, alignment: .topLeading)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    TitleWithDescription(title: "Categories", description: "Thousands of articles in each category")
}
