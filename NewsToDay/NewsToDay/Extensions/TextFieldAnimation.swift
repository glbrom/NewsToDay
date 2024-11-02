//
//  TextFieldAnimation.swift
//  NewsToDay
//
//  Created by Roman Golub on 02.11.2024.
//

import SwiftUI

struct ExampleTextFieldAnimation: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        VStack {
            TextFieldAnimation(title: "First name", text: $firstName)
            TextFieldAnimation(title: "Last name", text: $lastName)
        }
        .padding()
    }
}

struct TextFieldAnimation: View {
    var title: LocalizedStringKey
   
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    var body: some View {
            ZStack(alignment: .leading) {
                
                TextField("", text: $text)
                    .padding(.leading)
                    .font(.interFont(.medium, size: 16))
                    .frame(height: 50)
                    .focused($isTyping)
                    .background(isTyping ? .white : .greyLighter)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isTyping ? .purplePrimary : Color.clear, lineWidth: 1)
                    )
                
                Text(title).padding(.horizontal, 4)
                    .font(.interFont(.medium, size: 16))
                //                .keyboardType(.numberPad)
                    .background(.blue.opacity(isTyping || !text.isEmpty ? 1 : 0), in: RoundedRectangle(cornerRadius: 4))
                    .foregroundStyle(isTyping ? .greyLighter : .greyPrimary)
                    .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                    .onTapGesture {
                        isTyping.toggle()
                    }
            }
            .animation(.linear(duration: 0.2), value: isTyping)
    }
}

#Preview {
    ExampleTextFieldAnimation()
}
