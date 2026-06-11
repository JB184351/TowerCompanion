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
    var scoutName: String = ""
    var weapon: Weapon = Weapon(name: "Dreadbound", altFire: AltFire(name: "Trackerswarm", level: 3, altFireDescription: "Test"), traits: [Trait(name: "Expanding Shards", traitDescription: "Yes", level: 3)], level: 3)
    var artifacts: [Artifact]?
    var parasites: [Parasite]?
    var stats: Stats = Stats(weaponDamage: 0.0, protection: 1.0, proficiencyRate: 2.0, repairEfficiency: 3.0, altFireCoolDown: 4.0)
    var malfunctions: [Malfunction]?
    var score: Int = 0
    var finalMultiplier: Double = 0.0
    var averageMultiplier: Double = 0.0
    var highestMultiplier: Double = 0.0
    var phase: Int = 0
    var room: Int = 0
    var platform: String = "PS5"
    var combat: Combat?
    var explorer: Explorer?
    var skill: Skill?
    var objectives: Objectives?
    var dateStarted: Date = Date.now
    var dateCompleted: Date = Date.now
    
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
