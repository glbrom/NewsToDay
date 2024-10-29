//
//  HomePage.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("selectedLanguage") private var language = LocalizationManager.shared.language
    var body: some View {
        Text("Home")
    }
}

#Preview {
    HomePage()
}
