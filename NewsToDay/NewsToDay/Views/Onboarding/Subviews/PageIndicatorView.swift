//
//  PageIndicatorView.swift
//  NewsToDay
//
//  Created by Roman Golub on 23.10.2024.
//

import SwiftUI

struct PageIndicatorView: View {
    // MARK: - Properties
    @Binding var currentStep: Int
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(1..<4) { item in
                if item == currentStep {
                    Rectangle()
                        .frame(width: 24, height: 8)
                        .cornerRadius(20)
                        .foregroundColor(Constants.Colors.purplePrimary)
                        .transition(.scale)
                        .animation(.easeInOut, value: currentStep)
                } else {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Constants.Colors.greyLighter)
                }
            }
        }
    }
}

#Preview {
    PageIndicatorView(currentStep: .constant(1))
}
