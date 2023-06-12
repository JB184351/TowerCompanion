//
//  Player.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import Foundation
import SwiftData

@Model
struct Player {
    var scoutName: String?
    var weapon: Weapon?
    var artifacts: [String]?
    var parasites: [Parasite]?
    var augments: [String]?
    var stats: [String]?
    var score: Int?
    var phase: Int?
    var room: Int?
    var dateCompleted: Date?
}
