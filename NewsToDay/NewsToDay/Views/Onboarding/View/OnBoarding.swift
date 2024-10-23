//
//  OnBoarding.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct OnBoarding: View {
    var square: String = "square"
    var city: String = "city"
    var firstToKnow: String = "First to know"
    var titleText: String =  "All news in one place, be\n the first to know last news"
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                    .frame(height: 50)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Image(square)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 288, height: 366)
                        
                        Image(city)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 288, height: 366)
                    }
                    .padding(.horizontal, 20)
                    
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 366)
                
                
               customProgressView(activeIndex: 0, totalSteps: 3)
                    .padding(.top, 20)
                
                
                Text(firstToKnow)
                    .foregroundColor(.blackPrimary)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                
                Spacer()
                Text(titleText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
                DefaultButtonView()
                    .padding(.trailing,2)
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    OnBoarding()
}

func customProgressView(activeIndex: Int, totalSteps: Int) -> some View {
      HStack(spacing: 12) {
          ForEach(0..<totalSteps, id: \.self) { index in
              if index == activeIndex {
                  
                  Capsule()
                      .fill(Color.blue)
                      .frame(width: 24, height: 8)
              } else {
                
                  Circle()
                      .fill(Color.gray.opacity(0.2))
                      .frame(width: 8, height: 8)
              }
          }
      }
  }
