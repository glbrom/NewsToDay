//
//  DefaultButtonView.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/21/24.
//


import SwiftUI
struct DefaultButtonView: View{
    var buttonText: String?
    var next: String = "Next"
    var body: some View{
        VStack(alignment: .center){
            Button(action:{
                // action
            })
            {
                Text(buttonText ?? next)
                    .font(.system(size:16 ))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 336, height: 56)
                    .background(.purplePrimary)
                    .cornerRadius(12)
                    
                
            }
        }
    }
}

#Preview {
    DefaultButtonView()
}
