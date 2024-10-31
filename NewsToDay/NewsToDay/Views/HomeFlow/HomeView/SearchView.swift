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
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    SearchView(searchQuery: .constant(""))
}
