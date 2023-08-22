//
//  AltFire.swift
//  TowerCompanion
//
//  Created by Justin on 6/12/23.
//

import Foundation

struct AltFire: Codable, Hashable {
    var name: String
    var level: Int
    var altFireDescription: String
    
    static func getAltFireDescriptions(altfireName: String) -> String {
        switch altfireName {
        case "Blast Shell":
            return "Lobs a grenade-light projectile that explodes on contact with an enemy, or after enough time has passed."
        case "Doombringer":
            return "A chargeable attack that create a large, slow-moving orb that damages anything near it. Detonates in a large explosion once it hits an enemy, or travels far enough. Can destroy red shields; if it his a shield, it may bounce to a new angle."
        case "Horizontal Barrage":
            return "Creates a large, horizontal array of projectiles that do modest amounts of damage. If nothing is hit, it will bounce a bit."
        case "Killsight":
            return "A sniper-like attack that, if used against the weak spot of an enemy, will do significant amounts of damage."
        case "Proximity Mine":
            return "Lobs a mine that will explode if an enemy comes close enough to it, or enough time has passed."
        case "Shieldbreaker":
            return "A powerful beam that can destroy red shields and damage enemies using them."
        case "SHockstream":
            return "A long, continuous short-range electrical attack that randomly targets things in front of you. Great against packs of enemies."
        case "Tendrilpod":
            return "Lobs a tentacle creature that does damage over time to whatever enemy is close to it. Seems to stick to enemies if hit, otherwise can do damage to things in its vicinity."
        case "Trackerswarm":
            return "Fires a cluster of homing bullets that zero-in on the nearest target."
        case "Vertical Barrage":
            return "Like the Horizontal Barrage, but instead fires a 'wall' of projectiles stacked top to bottom."
        case "Voidbeam":
            return "A long, continuous beam that deals increasing damage if kept on a single target."
        default:
            return ""
        }
    }
    
    static func getAllAltFires() -> [AltFire] {
        var altFires = [AltFire]()
        
        let blastShell = AltFire(name: "Blast Shell", level: 3, altFireDescription: "Lobs a grenade-light projectile that explodes on contact with an enemy, or after enough time has passed.")
        
        let doomBringer = AltFire(name: "Doom Bringer", level: 3, altFireDescription: "A chargeable attack that create a large, slow-moving orb that damages anything near it. Detonates in a large explosion once it hits an enemy, or travels far enough. Can destroy red shields; if it his a shield, it may bounce to a new angle.")
        
        let horizontalBarrage = AltFire(name: "Horizontal Barrage", level: 3, altFireDescription: "Creates a large, horizontal array of projectiles that do modest amounts of damage. If nothing is hit, it will bounce a bit.")
        
        let killSight = AltFire(name: "Killsight", level: 3, altFireDescription: "A sniper-like attack that, if used against the weak spot of an enemy, will do significant amounts of damage.")
        
        let proximityMine = AltFire(name: "Proximity Mine", level: 3, altFireDescription: "Lobs a mine that will explode if an enemy comes close enough to it, or enough time has passed.")
        
        let shieldBreaker = AltFire(name: "Shieldbreaker", level: 3, altFireDescription: "A powerful beam that can destroy red shields and damage enemies using them.")
        
        let shockStream = AltFire(name: "Shockstream", level: 3, altFireDescription: "A long, continuous short-range electrical attack that randomly targets things in front of you. Great against packs of enemies.")
        
        let tendrilpod = AltFire(name: "Tendrilpod", level: 3, altFireDescription: "Lobs a tentacle creature that does damage over time to whatever enemy is close to it. Seems to stick to enemies if hit, otherwise can do damage to things in its vicinity.")
        
        let trackerSwarm = AltFire(name: "Trackerswarm", level: 3, altFireDescription: "Fires a cluster of homing bullets that zero-in on the nearest target.")
        
        let verticalBarrage = AltFire(name: "Vertical Barrage", level: 3, altFireDescription: "Like the Horizontal Barrage, but instead fires a 'wall' of projectiles stacked top to bottom.")
        
        let voidBeam = AltFire(name: "Voidbeam", level: 3, altFireDescription: "A long, continuous beam that deals increasing damage if kept on a single target.")
        
        altFires.append(blastShell)
        altFires.append(doomBringer)
        altFires.append(horizontalBarrage)
        altFires.append(killSight)
        altFires.append(proximityMine)
        altFires.append(shieldBreaker)
        altFires.append(shockStream)
        altFires.append(tendrilpod)
        altFires.append(trackerSwarm)
        altFires.append(verticalBarrage)
        altFires.append(voidBeam)
        
        return altFires
    }
}
