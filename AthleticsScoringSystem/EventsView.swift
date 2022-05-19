//
//  EventsView.swift
//  Athletics Scorer
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//
import SwiftUI


struct EventsView: View {
    @StateObject var viewModel = FirebaseViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.events) { event in
                    
                    NavigationLink(destination: EventView(event: event), label: {
                        Text(event.name)
                    })
                }
                
            }
            .onAppear {
                viewModel.observeEvents()
            }
            .navigationBarTitle("Events")
        }
    }
}
