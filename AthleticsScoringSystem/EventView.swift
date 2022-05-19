//
//  EventView.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//

import SwiftUI

struct EventView: View {
    @State var event: Event
    
    var body: some View {
        Text(event.name)
            .font(.title)
        List(event.athletes) { athlete in
            HStack {
                Text("\(athlete.position)")
                Text(athlete.name)
                Text(athlete.school)
                Text((round(athlete.score * 1000) / 1000).description)
            }
            .padding()
        }
    }
}
