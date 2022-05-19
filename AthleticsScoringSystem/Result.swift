//
//  Result.swift
//  AthleticsScoringSystem
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//

import SwiftUI

struct Result: Identifiable, Codable {
    var school: String
    var ageGroup: String
    var points: Int
    var id: String = UUID().uuidString
}
