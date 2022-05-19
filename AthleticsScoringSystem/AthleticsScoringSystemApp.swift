//
//  AthleticsScoringSystemApp.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//


import SwiftUI
import Firebase

@main
struct AthleticsScoringSystemApp: App {
    init() {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
      }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
