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
    var artifacts: [Artifact]?
    var parasites: [Parasite]?
    var stats: Stats
    var malfunctions: [Malfunction]?
    var score: Int
    var finalMultiplier: Double
    var averageMultiplier: Double
    var highestMultiplier: Double
    var phase: Int
    var room: Int
    var platform: String
    var combat: Combat?
    var explorer: Explorer?
    var skill: Skill?
    var objectives: Objectives?
    var dateStarted: Date
    var dateCompleted: Date
    
    init(scoutName: String, weapon: Weapon, artifacts: [Artifact]?, parasites: [Parasite]?, stats: Stats, malfunctions: [Malfunction]?, score: Int, multiplier: Double, averageMultiplier: Double, highestMultplier: Double, phase: Int, room: Int, platform: String, combat: Combat?, explorer: Explorer?, skill: Skill?, objectives: Objectives?, dateStarted: Date, dateCompleted: Date) {
        self.scoutName = scoutName
        self.weapon = weapon
        self.artifacts = artifacts
        self.parasites = parasites
        self.stats = stats
        self.malfunctions = malfunctions
        self.score = score
        self.finalMultiplier = multiplier
        self.averageMultiplier = averageMultiplier
        self.highestMultiplier = highestMultplier
        self.phase = phase
        self.room = room
        self.platform = platform
        self.combat = combat
        self.explorer = explorer
        self.skill = skill
        self.objectives = objectives
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
    }
}
