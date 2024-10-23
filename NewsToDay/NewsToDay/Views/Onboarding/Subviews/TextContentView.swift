//
//  TextContentView.swift
//  NewsToDay
//
//  Created by Roman Golub on 23.10.2024.
//

import SwiftUI

// MARK: - TextContentView
struct TextContentView: View {
    // MARK: - Properties
    @Binding var currentStep: Int
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(currentStep < 2 ? "First to know" : " ")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.Colors.blackPrimary)
                .frame(width: 216, alignment: .top)
            
            Text("All news in one place, be the first to know last news")
                .font(Font.custom("Inter", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.Colors.greyPrimary)
                .frame(width: 216, alignment: .top)
                .padding(.top, 24)
        }
    }
}

#Preview {
    TextContentView(currentStep: .constant(3))
}
