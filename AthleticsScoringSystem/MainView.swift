//
//  MainView.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ResultsView()
                .tabItem {
                    Label("Results", systemImage: "newspaper")
                }
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "flag")
                }
        }
    }
}
