//
//  Malfunction.swift
//  TowerCompanion
//
//  Created by Justin on 6/12/23.
//

import Foundation

enum MalfunctionType: Codable, Hashable {
    case normal
    case permanent
}

struct Malfunction: Codable, Hashable {
    var malfunctionDescription: String
    var conditionToRemove: String
    var malfunctionType: MalfunctionType
    
    static func getAllPermanentMalfunctions() -> [String] {
        let obolitesDisappear = "Obolites disappear 1.5s faster"
        let loseObolites = "Lose Oboloites when suffering damage."
        let midAir = "While in midair, -50% Weapon Damage"
        let counterOnHit = "Hostiles counter on hit."
        let meleeCooldown = "Melee cooldown increased by 2s."
        let stationary = "While stationary, Weapon Damage reduced by 75%"
        let reduceIntegrity = "Max Integrity reduced."
        
        let permanentMalfunctions = [obolitesDisappear, loseObolites, midAir, counterOnHit, meleeCooldown, stationary, reduceIntegrity]
        
        return permanentMalfunctions
    }
}
