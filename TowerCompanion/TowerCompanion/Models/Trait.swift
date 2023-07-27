//
//  Attribute.swift
//  TowerCompanion
//
//  Created by Justin on 6/11/23.
//

import Foundation

struct Trait: Codable {
    var name: String
    var traitDescription: String
    var level: Int
    
    static func getWeaponTraitDescriptionForDreadbound(traitDescription: String) -> String {
        switch traitDescription {
        case "Fourth Shard":
            return "This weapon fires out a fourth shard."
        case "Obolite Magnet":
            return "Obolite collection radius is increased when this weapon is equipped."
        case "Staggering":
            return "Enemies hit by this weapon become Staggered more easily."
        case "Protection Steal":
            return "Every time the shards from the weapon hit an enemy, Selene gets a small, temporary boost in Protection when the shard returns to the weapon."
        case "Expanding Shard":
            return "Projectiles from this weapon get larger and deal more damage the further they travel."
        case "Returning Damage":
            return "The shards from this weapon deal damage as they return to the weapon."
        case "Explosive Shards":
            return "The shards from this weapon explode upon impact."
        case "Damage Steal":
            return "Every time the shards from this weapon hit an enemy, Selene gets a small, temporary boost in Damage when the shard returns to the weapon."
        case "Obolite Generator":
            return "This weapon generates Obolites every time the shards from this weapon hit an enemy."
        default:
            return ""
        }
    }
}
