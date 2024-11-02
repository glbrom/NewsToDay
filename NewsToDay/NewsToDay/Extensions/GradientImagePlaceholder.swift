//
//  GradientImagePlaceholder.swift
//  NewsToDay
//
//  Created by Roman Golub on 01.11.2024.
//

import SwiftUI

extension View {
    func applyGradient() -> some View {
        self.overlay(
            LinearGradient(
                colors: [Color.black.opacity(0.8), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
        )
    }
}
