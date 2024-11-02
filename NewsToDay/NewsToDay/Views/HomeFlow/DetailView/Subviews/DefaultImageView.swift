//
//  DefaultImageView.swift
//  NewsToDay
//
//  Created by Roman Golub on 01.11.2024.
//

import SwiftUI

struct DefaultImageView: View {
    var scaleEffect: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color.purplePrimary
                .applyGradient()
                .ignoresSafeArea()
            
            ProgressView()
                .tint(.purpleLighter)
                .contrast(2)
                .scaleEffect(scaleEffect)
        }
    }
}

#Preview {
    DefaultImageView()
}


//struct DefaultImageView: View {
//    var body: some View {
//        ZStack {
//            Color.purplePrimary
//                .applyGradient()
//                .ignoresSafeArea()
//            
//            GeometryReader { geometry in
//                ProgressView()
//                    .tint(.purpleLighter)
//                    .contrast(2)
//                    .scaleEffect(1.5)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height * 1 / 3)
//            }
//        }
//    }
//}
