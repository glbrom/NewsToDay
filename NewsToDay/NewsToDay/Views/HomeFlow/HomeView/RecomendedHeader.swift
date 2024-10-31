//
//  RecomendedHeader.swift
//  NewsToDay
//
//  Created by dsm 5e on 31.10.2024.
//

import SwiftUI

struct RecomendedHeader: View {
    var onSeeAll: (() -> Void)?
    
    var body: some View {
        HStack {
            Text("Recomended for you")
                .bold()
            Spacer()
            Button {
                onSeeAll?()
            } label: {
                Text("See all")
                    .foregroundStyle(.greyLight)
            }
        }
        .padding()
    }
}

#Preview {
    RecomendedHeader()
}
