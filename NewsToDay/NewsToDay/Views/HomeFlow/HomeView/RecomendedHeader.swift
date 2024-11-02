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
                .font(.interFont(.semiBold, size: 20))
                .foregroundColor(.blackPrimary)
            
            Spacer()
            
            Button {
                onSeeAll?()
            } label: {
                Text("See all")
                    .font(.interFont(.medium, size: 14))
                    .foregroundStyle(.greyPrimary)
            }
        }
    }
}

#Preview {
    RecomendedHeader()
}
