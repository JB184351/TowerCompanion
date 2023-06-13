//
//  Player.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import Foundation
import SwiftData

@Model
final class Player {
    var scoutName: String?
    var weapon: Weapon?
    var artifacts: [String]?
    var parasites: [Parasite]?
    var augments: [String]?
    var stats: [String]?
    var malfunctions: [Malfunction]?
    var score: Int?
    var multiplier: Double?
    var averageMultiplier: Double?
    var phase: Int?
    var room: Int?
    var dateCompleted: Date?
    
    init(scoutName: String?, weapon: Weapon?, artifacts: [String]?, parasites: [Parasite]?, augments: [String]?, stats: [String]?, score: Int?, multiplier: Double?, averageMultiplier: Double?, phase: Int?, room: Int?, dateCompleted: Date?) {
        self.scoutName = scoutName
        self.weapon = weapon
        self.artifacts = artifacts
        self.parasites = parasites
        self.augments = augments
        self.stats = stats
        self.score = score
        self.multiplier = multiplier
        self.averageMultiplier = averageMultiplier
        self.phase = phase
        self.room = room
        self.dateCompleted = dateCompleted
    }
}
