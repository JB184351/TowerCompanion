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
    
    private static func getWeaponTraitDescriptionForDreadbound(trait: String) -> String {
        switch trait {
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
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForHollowseeker(trait: String) -> String {
        switch trait {
        case "Phasing Rounds":
            return "Projectiles can pass through surfaces."
        case "Waves":
            return "Sustained fire releases wide energy waves in addition to the regular projectiles."
        case "Serrated Projectiles":
            return "Projectiles cause additional damage over time."
        case "Retarget":
            return "Projectiles seek out additional hostiles upon hitting the initial target."
        case "Shrapnel":
            return "Projectiles may explode into multiple shards on impact."
        case "Split Stream":
            return "When this weapon is fired, an additional stream of homing shards are also fired."
        case "Portal Beam":
            return "Creates a beam-firing portal that targets nearby hostiles."
        case "Oscillator":
            return "Projectiles are fired in a larger, oscillating pattern and deal increased damage."
        case "Portal Turret":
            return "Creates a projectile-firing portal that targets nearby hostiles."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForRotglandLobber(trait: String) -> String {
        switch trait {
        case "Durable Rot":
            return "Increases the duration of the rot."
        case "Trailing Rot":
            return "Projectiles leave a trail of rot on the ground."
        case "Bouncing Rot":
            return "Projectiles bounce before exploding."
        case "Enlarged Chamber":
            return "Overheat limit increased."
        case "Explosive Rot":
            return "Projectiles explode on impact."
        case "Protective Rot":
            return "Standing in the rot provides extra Protection."
        case "Caustic Rot":
            return "Direct hits cause additional damage over time."
        case "Tendril Rot":
            return "Tendrils reach out from the rot puddles dealing damage to hostiles."
        case "Portal Rot":
            return "Hostiles killed by the rot create a projectile-firing portal."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForCoilspineShredder(trait: String) -> String {
        switch trait {
        case "Alt-Fire Cooling":
            return "Reduces the cooldown of the current active Alt-Fire."
        case "Shattering Discs":
            return "Projectiles have a chance to shatter, dealing more damage, upon hitting an enemy"
        case "Adrenaline Discs":
            return "Each hit has a chance of awarding extra Adrenaline."
        case "Enlarged Chamber":
            return "Overload limit increased."
        case "Twin Discs":
            return "Fires a smaller projectile alongside the main projectile."
        case "Retarget":
            return "Projectiles seek out additional hostiles after hitting the initial target."
        case "Splitting Discs":
            return "Each hit has a chance to deal extra damage."
        case "Enhanced Charge":
            return "Fully charged projectiles deal even more damage."
        case "Negating Discs":
            return "Projectiles from this weapon can destroy enemy projectiles."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForElectropylon(trait: String) -> String {
        switch trait {
        case "Obolite Extractor":
            return "Hostiles have a higher chance to drop Obolite Chunks."
        case "Silphium Extractor":
            return "Hostiles killed by pylons have a higher chance to drop Silphium."
        case "Pylon Web":
            return "The weapon's projectiles are condensed into a smaller number of rounds, with every projectile firing a web of pylons all at once."
        case "Finisher":
            return "Pylons deal more damage when a tethered enemy is at low health."
        case "Streamlined Chamber":
            return "This weapon has a quicker fire rate."
        case "Enlarged Chamber":
            return "The weapon has a larger Overload limit."
        case "Blade Harmonizer":
            return "Selene does more melee damage when near a pylon."
        case "Blade Pulse":
            return "Damaging enemeies with a melee attack triggers a damaging pulse from nearby pylons."
        case "Protective Pylons":
            return "Selene has more Protection when near a pylon."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForTachyomaticCarbine(trait: String) -> String {
        switch trait {
        case "Armor Piercing":
            return "Projectiles will pierce hostiles and ricochet off of surfaces."
        case "Critical Hit":
            return "Projectiles may deal additional damage."
        case "Hardened":
            return "Increases Protection."
        case "High Caliber":
            return "Higher damage at the expense of firerate."
        case "Rising Pitch":
            return "Fires faster the longer the trigger is held."
        case "Payload Rounds":
            return "Killed hostiles drop clusters of miniature bombs upon death."
        case "Leech Rounds":
            return "Successful hits have a small chance to repair Integrity."
        case "Hyper Accurate":
            return "Accuracy and recoil greatly improved."
        case "Accelerated":
            return "Kills decrease dash cooldown and increase firerate."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionForThermogenicLauncher(trait: String) -> String {
        switch trait {
        case "Easy to Use":
            return "Kills reward extra Profieiency."
        case "Obolite Magnet":
            return "Chance to automatically gather Obolite from killed hostiles."
        case "Critical Rockets":
            return "Projectiles may explode twice."
        case "Enlarged Chamber":
            return "Overheat limit increased."
        case "Replicating Hits":
            return "Successful hits shoot off an extra homing rocket."
        case "Mega Rocket":
            return "Fires a more powerful but slower rocket instead of the normal salvo."
        case "Full Auto":
            return "Fires at full-auto mode."
        case "Thermite Rockets":
            return "Projectiles cause additional damage over time."
        case "Tail Fire":
            return "Fires an additional, more powerful projectile at the end of each salvo."
        default:
            return ""
        }
    }
    
    private static func getWeaponTraitDescriptionForPyroshellCaster(trait: String) -> String {
        switch trait {
        case "Streamlined Chamber":
            return "This weapon has a faster fire rate."
        case "Secondary Explosion":
            return "Every shot fired also fires out a second projectile just like the original."
        case "Bouncy Projectiles":
            return "Projectiles from this weapon bounce once before exploding."
        case "Sticky Bonus":
            return "Projectiles stick to enemies and surfaces before exploding."
        case "Seeking Flares":
            return "Projectiles can track enemies."
        case "Enlarged Chamber":
            return "This weapon has a larger Overload limit."
        case "Anti-Gravity Projectiles":
            return "Projectiles fired travel in a straight line."
        case "Auxiliary Projectiles":
            return "Every shot fired also fires out a smaller, but more explosive projectile."
        case "Simmering Explosion":
            return "Projectiles deal damage to nearby hostiles before and after exploding."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    private static func getWeaponTraitDescriptionsForPistol(trait: String) -> String {
        switch trait {
        case "Homing Missile":
            return "Fires homing missiles in addition to normal projectiles."
        case "Ricochet":
            return "Projectiles will ricochet off surfaces and angle towards nearby targets."
        case "Snubnose Barrel":
            return "Deals more damage at the cost of accuracy."
        case "Piercing":
            return "Projectiles will pierce through hostiles, potentially damaging hostiles behind them."
        case "Burst Fire":
            return "Fires multiple projectiles in a single burst at a penalty to recoil."
        case "Sharpnel":
            return "Projectiles have a chance to explode into multiple shards on impact."
        case "Charging Shot":
            return "Projectiles require charging, but are much more powerful."
        case "Serrated Projectiles":
            return "Projectiles cause additional damage over time."
        case "Hit Reload":
            return "Successful hits have a chance to instantly reload the weapon."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    static private func getWeaponTraitDescriptionForSpitMaw(trait: String) -> String {
        switch trait {
        case "Wide Maw":
            return "Projectiles deal additional damage but have a wider spread."
        case "Narrow Maw":
            return "Projectiles have a tighter spread."
        case "Slug Shot":
            return "Fires an additional straight line projectile."
        case "Explosive Spit":
            return "Projectiles explode upon hitting an enemy or after a set distance."
        case "Rapid Spitter":
            return "Gives full-auto fire."
        case "Backsplash":
            return "High chance to regain a projectile if all pellets hit a target."
        case "Critical Stagger":
            return "Projectiles may deal additional damage to staggered hostiles."
        case "Piercing Spit":
            return "Projectiles will pierce through hostiles and explode on delay."
        case "Acid Clouds":
            return "Each shot leaves behind an acid cloud that can damage enemies."
        default:
            return "Couldn't get weapon trait description"
        }
    }
    
    static func getWeaponTraitDescriptions(weaponName: String, trait: String) -> String {
        switch weaponName {
        case "Dreadbound":
            return getWeaponTraitDescriptionForDreadbound(trait: trait)
        case "Hollowseeker":
            return getWeaponTraitDescriptionForHollowseeker(trait: trait)
        case "Rotgland Lobber":
            return getWeaponTraitDescriptionForRotglandLobber(trait: trait)
        case "Electropylon Driver":
            return getWeaponTraitDescriptionForElectropylon(trait: trait)
        case "Tachyomatic Carbine":
            return getWeaponTraitDescriptionForTachyomaticCarbine(trait: trait)
        case "Thermogenic Launcher":
            return getWeaponTraitDescriptionForThermogenicLauncher(trait: trait)
        case "Pyroshell Caster":
            return getWeaponTraitDescriptionForPyroshellCaster(trait: trait)
        case "Coilspine Shredder":
            return getWeaponTraitDescriptionForCoilspineShredder(trait: trait)
        case "Modified Sidearm SD-M8":
            return getWeaponTraitDescriptionsForPistol(trait: trait)
        case "Spitmaw Blaster":
            return getWeaponTraitDescriptionForSpitMaw(trait: trait)
        default:
            return "Couldn't get weapon trait description for \(weaponName) with \(trait)"
        }
    }
    
    static func getWeaponTraits(from weaponName: String) -> [String] {
        switch weaponName {
        case "Modified Sidearm SD-M8":
            return ["Homing Missile", "Ricochet", "Snubnose Barrel", "Piercing", "Burst Fire", "Sharpnel", "Charging Shot", "Serrated Projectiles", "Hit Reload"]
        case "Tachyomatic Carbine":
            return ["Armor Piercing", "Critical Hit", "Hardened", "High Caliber", "Rising Pithc", "Payload Rounds", "Leech Rounds", "Hypter-Accurate", "Accelerated"]
        case "Spitmaw Blaster":
            return ["Wide Maw", "Narrow Maw", "Slug Shot", "Explosive Spitter", "Rapid Spitter", "Backsplash", "Critical Stagger", "Piercing Spit", "Acid Clouds"]
        case "Pyroshell Caster":
            return ["Streamlined Chamber", "Secondary Explosion", "Bouncy Projectiles", "Sticky Bonus", "Seeking Flares", "Enlarged Chamber", "Anti-Gravity Projectiles", "Auxiliary Projectiles", "Simmering Explosion"]
        case "Coilspine Shredder":
            return ["Alt-Fire Cooling", "Shattering Discs", "Adrenaline Discs", "Enlarged Chamber", "Twin Discs", "Retarget", "Splitting Discs", "Enhanced Charge", "Negating Discs"]
        case "Thermogenic Launcher":
            return ["Easy To Use", "Obolite Magnet", "Critical Rockets", "Enlarged Chamber", "Replicating Hits", "Mega Rocket", "Full Auto", "Thermite Rockets", "Tail Fire"]
        case "Electropylon Driver":
            return ["Obolite Extractor", "Silphium Extractor", "Pylon Web", "Finisher", "Streamlined Chamber", "Enlarged Chamber", "Blade Harmonizer", "Blade Pulse", "Protective Pylons"]
        case "Rotgland Lobber":
            return ["Durable Rot", "Trailing Rot", "Bouncing Rot", "Enlarged Chamber", "Explosive Rot", "Protective Rot", "Caustic Rot", "Tendril Rot", "Portal Rot"]
        case "Hollowseeker":
            return ["Phasing Rounds", "Waves", "Retarget", "Serrated Projectiles", "Sharpnel", "Split Stream", "Portal Beam", "Oscillator", "Portal Turret"]
        case "Dreadbound":
            return ["Fourth Shard", "Obolite Magnet", "Staggering", "Proection Steal", "Expanding Shards", "Returning Damage", "Explosive Shards", "Damage Steal", "Obolite Generator"]
        default:
            return []
        }
    }
}
