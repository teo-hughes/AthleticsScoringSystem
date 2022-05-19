//
//  Event.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//

import SwiftUI

struct Event: Identifiable, Codable {
    var athletes: [Athlete]
    var name: String
    var id: String = UUID().uuidString
}

