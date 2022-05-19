//
//  Athlete.swift
//  Athletics Scorer
//
//  Created by Hughes, Teo (BJH) on 19/05/2022.
//
import SwiftUI

struct Athlete: Identifiable, Codable {
    var event: String
    var name: String
    var points: Int
    var position: Int
    var score: Double
    var school: String
    var id: String = UUID().uuidString
}

