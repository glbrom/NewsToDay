//
//  NewsToDayApp.swift
//  NewsToDay
//
//  Created by Roman Golub on 21.10.2024.
//

import SwiftUI
import Firebase

@main
struct NewsToDayApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            OnBoarding()
        }
    }
}
