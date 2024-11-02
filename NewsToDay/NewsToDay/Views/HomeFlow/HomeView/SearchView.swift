//
//  SearchView.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchQuery: String
    
    var body: some View {
        HStack(spacing: 24) {
            Image(.search)
            
            TextField("Search", text: $searchQuery)
                .font(.interFont(.medium, size: 16))
                .foregroundColor(.greyPrimary)
        }
        .padding()
        .background(.greyLighter)
        .cornerRadius(12)
    }
}

#Preview {
    SearchView(searchQuery: .constant(""))
}
