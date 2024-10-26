//
//  CustomTextField.swift
//  NewsToDay
//
//  Created by Ylyas Abdywahytow on 10/25/24.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    var icon: Image
    var placeholder: LocalizedStringKey
    @Binding var text: String
    var isSecure: Bool = false
    @State private var isPasswordVisible: Bool = false
    var promptEmail: LocalizedStringKey =  "Email Adress"
    // MARK: - Body
    var body: some View {
        HStack {
            icon
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.greyPrimary)
            
            if isSecure {
                if isPasswordVisible {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.greyPrimary)
                        .font(.interFont(.medium, size: 16))
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.greyPrimary)
                        .font(.interFont(.medium, size: 16))
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.greyPrimary)
                }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.greyPrimary)
                    .font(.interFont(.medium, size: 16))
            }
        }
        .padding(.horizontal, 16)
        .frame(width: 336, height: 56)
        .background(Color.greyLighter)
        .cornerRadius(12)
    }
}
