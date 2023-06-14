//
//  Weapon.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import Foundation

struct Weapon: Codable {
    var name: String?
    var altFire: AltFire?
    var stats: [WeaponStat]?
    var traits: [Trait]?
    var level: [String]?
}
