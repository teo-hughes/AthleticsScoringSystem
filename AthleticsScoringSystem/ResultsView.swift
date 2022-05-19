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
            VStack {
                
                VStack {
                    Text("Overall")
                        .font(.title2)
                        .padding()
                    ForEach(viewModel.results, id: \.self) { result in
                        if result.ageGroup == "Overall" {
                            HStack {
                                Text(result.school)
                                Text("\(result.points)")
                            }
                        }
                    }
                }
                .padding()
                
                HStack {
                    VStack {
                        Text("Senior")
                            .font(.title2)
                            .padding()
                        ForEach(viewModel.results, id: \.self) { result in
                            if result.ageGroup == "Senior" {
                                HStack {
                                    Text(result.school)
                                    Text("\(result.points)")
                                }
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        Text("U17")
                            .font(.title2)
                            .padding()
                        ForEach(viewModel.results, id: \.self) { result in
                            if result.ageGroup == "U17" {
                                HStack {
                                    Text(result.school)
                                    Text("\(result.points)")
                                }
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        Text("U15")
                            .font(.title2)
                            .padding()
                        ForEach(viewModel.results, id: \.self) { result in
                            if result.ageGroup == "U15" {
                                HStack {
                                    Text(result.school)
                                    Text("\(result.points)")
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                
            }
            .onAppear {
                viewModel.observeResults()
            }
            .navigationBarTitle("Results")
        }
    }
}
