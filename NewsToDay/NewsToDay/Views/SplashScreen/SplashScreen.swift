//
//  SplashScreen.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct SplashScreen: View {
    
    // MARK: - Properties
    @State private var isActive = false
    
    // MARK: - Body
    var body: some View {
        
        if isActive {
            OnBoarding()
        } else {
            ZStack {
                Constants.Backgrounds.darkBlueBackground.ignoresSafeArea()
                VStack {
                    Text("News")
                        .font(Font.system(size: 64))
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Constants.Colors.purpleLighter)
                        .padding(EdgeInsets(top: 303, leading: 58, bottom: 0, trailing: 131))
                    Text("ToDay")
                        .font(Font.system(size: 64))
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Constants.Colors.purpleLighter)
                        .padding(EdgeInsets(top: 0, leading: 131, bottom: 400, trailing: 58))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
