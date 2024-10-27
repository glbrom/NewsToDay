//
//  LanguageView.swift
//  NewsToDay
//
//  Created by Serge Eliseev on 23.10.2024.
//

import SwiftUI

struct LanguageView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("selectedLanguage") private var selectedLanguage: String?
    
       @ObservedObject private var localizationManager = LocalizationManager.shared
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Constants.Icons.leftArrow
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 20)
                
                Text("Language")
                    .font(.interFont(.semiBold, size: 24))
                    .padding(.trailing, 130)
                    .padding(.leading, 86)
                
            }
            .padding(.top, 24)
            
            VStack {
                Button(action: {
                    localizationManager.language = .en
                    selectedLanguage = "English"
                }) {
                    buttonStyle(language: "English", isSelected: selectedLanguage == "English")
                }
                
                Button(action: {
                    localizationManager.language = .ru
                    selectedLanguage = "Russian"
                }) {
                    buttonStyle(language: "Russian", isSelected: selectedLanguage == "Russian")
                }
                .padding(.top, 8)
                
                Spacer()
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
        }
        .background(.white)
        .navigationBarHidden(true)
    }
    
    // MARK: - Methods
    func buttonStyle(language: String, isSelected: Bool) -> some View {
        HStack {
            Text(language)
                .font(.interFont(.semiBold, size: 16))
                .foregroundColor(isSelected ? .white : .greyDark)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .padding(.leading, 24)
                .padding(5)
            
            if isSelected {
                Constants.Icons.checkMark
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 16)
            }
        }
        .background(isSelected ? .purplePrimary : .greyLighter)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    LanguageView()
}
