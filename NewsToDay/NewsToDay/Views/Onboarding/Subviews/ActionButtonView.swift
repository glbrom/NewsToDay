//
//  ActionButtonView.swift
//  NewsToDay
//
//  Created by Roman Golub on 23.10.2024.
//

import SwiftUI

// MARK: - ActionButtonView
struct ActionButtonView: View {
    // MARK: - Properties
    var buttonText: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.interFont(.semiBold, size: 16))
                .frame(width: 336, height: 56)
                .background(Constants.Colors.purplePrimary)
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ActionButtonView(buttonText: "Next", action: {})
}
