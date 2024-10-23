//
//  LanguageView.swift
//  NewsToDay
//
//  Created by Serge Eliseev on 23.10.2024.
//



import SwiftUI

struct LanguageView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("selectedLanguage") private var selectedLanguage: String?
    
    var body: some View {
        NavigationView {
            VStack {

                Button(action: {
                    selectedLanguage = "English"
                }) {
                    buttonStyle(language: "English", isSelected: selectedLanguage == "English")
                }
                
                Button(action: {
                    selectedLanguage = "Russian"
                }) {
                    buttonStyle(language: "Russian", isSelected: selectedLanguage == "Russian")
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ArrowLeft")
                    }
                    .padding()
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Language")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .navigationBarBackButtonHidden(false)
            .padding(.horizontal)
        }
        
    }


    func buttonStyle(language: String, isSelected: Bool) -> some View {
        HStack {
            Text(language)
                .font(.title3)
                .foregroundColor(isSelected ? Color.white : Color.black) // Цвет текста в зависимости от выбора
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .padding(.leading, 25)
                .padding(5)

            if isSelected {
                Image("Checkmark")
                    .padding(.horizontal, 30)
            }
        }
        .background(isSelected ? .purplePrimary : .greyLighter) // Цвет фона в зависимости от выбора
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    LanguageView()
}
