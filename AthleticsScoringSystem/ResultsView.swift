//
//  ResultsView.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//

import SwiftUI

struct ResultsView: View {
    @StateObject var viewModel = FirebaseViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.results) { result in
                    
                    HStack {
                        Text(result.school)
                        Text(result.ageGroup)
                        Text("\(result.points)")
                    }
                }
                
                
            }
            .onAppear {
                viewModel.observeResults()
            }
            .navigationBarTitle("Results")
        }
    }
}
