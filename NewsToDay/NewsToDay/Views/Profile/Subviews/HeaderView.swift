//
//  HeaderView.swift
//  NewsToDay
//
//  Created by Roman Golub on 26.10.2024.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var viewModel: RegisterViewModel
    // MARK: - Body
    var body: some View {
        HStack {
            Image("ImageProfile")
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .clipShape(Circle())
            
            VStack {
                Text(viewModel.username)
                    .foregroundStyle(.blackPrimary)
                    .font(.interFont(.semiBold, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 12)
                    .padding(.horizontal, 24)
                
                Text(viewModel.email)
                    .foregroundStyle(.greyLight)
                    .font(.interFont(.regular, size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 1)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    HeaderView(viewModel: RegisterViewModel())
}
