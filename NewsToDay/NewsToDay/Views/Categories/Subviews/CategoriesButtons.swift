//
//  CategoriesButtons.swift
//  NewsToDay
//
//  Created by Roman Golub on 25.10.2024.
//

import SwiftUI

struct CategoriesButtons: View {
    // MARK: - Properties
    @State private var selectedItems: Set<Constants.IconsEmojiCategories> = []
    
    let buttonArray = Constants.buttonArray
    var unselectedColor: Color = .clear
    
    // MARK: - Body
    var body: some View {
        VStack {
            ForEach(buttonArray, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button{
                            toggleSelection(for: item)
                        } label: {
                            Text(item.rawValue)
                                .font(.interFont(.semiBold, size: 16))
                                .multilineTextAlignment(.center)
                                .frame(width: 160, height: 72)
                                .foregroundColor(selectedItems.contains(item) ? Color.white : Constants.Colors.greyDark)
                                .background(selectedItems.contains(item) ? Constants.Colors.purplePrimary : unselectedColor)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .inset(by: 0.5)
                                        .stroke(Constants.Colors.greyLighter, lineWidth: 2)
                                )
                                .padding(4)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Methods
    private func toggleSelection(for item: Constants.IconsEmojiCategories) {
        if selectedItems.contains(item) {
            // If already selected, remove from set
            selectedItems.remove(item)
        } else {
            // If not selected, add to the set
            selectedItems.insert(item)
        }
    }
}

#Preview {
    CategoriesButtons()
}
