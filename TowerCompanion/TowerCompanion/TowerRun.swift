//
//  TowerRun.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import Foundation
import SwiftData

@Model
final class TowerRun {
    var scoutName: String
    var weapon: Weapon
    var artifacts: [Artifact]
    var parasites: [Parasite]
    var stats: [String]?
    var malfunctions: [Malfunction]
    var score: Int
    var multiplier: Double
    var averageMultiplier: Double
    var phase: Int
    var room: Int
    var platform: String
    var dateCompleted: Date
    
    init(scoutName: String, weapon: Weapon, artifacts: [Artifact], parasites: [Parasite], stats: [String], score: Int, multiplier: Double, averageMultiplier: Double, phase: Int, room: Int, platform: String, dateCompleted: Date) {
        self.scoutName = scoutName
        self.weapon = weapon
        self.artifacts = artifacts
        self.parasites = parasites
        self.stats = stats
        self.score = score
        self.multiplier = multiplier
        self.averageMultiplier = averageMultiplier
        self.phase = phase
        self.room = room
        self.platform = platform
        self.dateCompleted = dateCompleted
    }
}
