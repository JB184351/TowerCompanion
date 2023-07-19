//
//  AddWeaponView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/23.
//

import SwiftUI

struct AddWeaponView: View {
    // Weapon Related Variables
    @State private var weaponName = "Modified Sidearm SD-M8"
    @State private var weaponLevel = 0
    @State private var altFireName = ""
    @State private var altFireLevel = 1
    @State private var altFIreDescription = ""
    @State private var weaponTraitLevel = 1
    @State private var weaponTraitNamesUsedInRun = [String]()
    @State private var weaponTraitNames: [String] = [""]
    @State private var weaponTraits = [Trait]()
    @State private var altFire = AltFire(name: "", level: 0, altFireDescription: "")
    @Binding var weapon: Weapon
    
    private let weaponNames = ["Modified Sidearm SD-M8", "Hollowseeker", "Electropylon Driver", "Rotgland Lobber", "Pyroshell Caster", "Thermogenic Launcher", "Dreadbound", "Coilspine Shredder", "Tachyomatic Carbine", "Spitmaw Blaster"]
    
    var altFires: [AltFire] {
        return AddWeaponView.getAllAltFires()
    }
    
    init(weapon: Binding<Weapon>) {
        _weaponTraitNamesUsedInRun = State(initialValue: Array(repeating: "", count: 1))
        self._weapon = weapon
    }
    
    
    var body: some View {
        Section {
            Picker("Weapon", selection: $weaponName) {
                ForEach(weaponNames, id: \.self) { weaponName in
                    Text("\(weaponName)").tag(weaponName)
                }
            }
            
            Picker("Level", selection: $weaponLevel) {
                ForEach(1..<46) {
                    Text("\($0)").tag($0)
                }
            }
            
            Picker("Alt-Fire", selection: $altFireName) {
                ForEach(altFires, id: \.self) { altFire in
                    Text(altFire.name).tag(altFire.name)
                }
            }
            
            Picker("Alt-Fire Level", selection: $altFireLevel) {
                ForEach(1..<4) {
                    Text("\($0)").tag($0)
                }
            }
            
            ForEach(0..<1, id: \.self) { index in
                Picker("Weapon Traits", selection: Binding(
                    get: { weaponTraitNames[index] },
                    set: { weaponTraitNames[index] = $0 }
                )) {
                    ForEach(weaponTraitNames, id: \.self) { weaponTrait in
                        Text(weaponTrait).tag(weaponTrait)
                    }
                }
            }
            .onAppear {
                weaponTraitNames = getWeaponTraits(from: "Modified Sidearm SD-M8")
            }
            .onChange(of: weaponName) { oldValue, newValue in
                weaponTraitNames = getWeaponTraits(from: weaponName)
                weaponTraits.removeAll()
            }
            
            Picker("Weapon Trait Level", selection: $weaponTraitLevel) {
                ForEach(1..<4) {
                    Text("\($0)").tag($0)
                }
            }
        }
        Section {
            Button("Add Weapon Trait") {
                addWeaponTrait()
            }
            .disabled(weaponTraits.count == 4)
            
            Button("Clear All") {
                clearValues()
            }
            .disabled(weaponTraits.count < 1)
            
            Button("Add Weapon") {
                addWeapon()
            }
            
            
        }
        
        Section(header: Text("Weapon Traits")) {
            ForEach(weaponTraits, id: \.name) { weapon in
                Text("\(weapon.name) \(weapon.level)")
            }
        }
    }
    
    private func addWeaponTrait() {
        let altFireDescription = getAltFireDescription(for: altFireName)
        
        for (index, _) in weaponTraitNamesUsedInRun.enumerated() {
            altFire = AltFire(name: altFireName, level: altFireLevel, altFireDescription: altFireDescription)
            let trait = Trait(name: weaponTraitNames[index], traitDescription: "", level: weaponTraitLevel)
            
            weaponTraits.append(trait)
            
            weaponTraitNames.remove(at: index)
        }
    }
    
    private func clearValues() {
        weaponTraitNamesUsedInRun.removeAll()
        weaponTraits.removeAll()
    }
    
    private func addWeapon() {
        self.weapon = Weapon(name: weaponName, altFire: altFire, traits: weaponTraits, level: weaponLevel)
    }
    
    private func getAltFireDescription(for altFireName: String) -> String {
        AddWeaponView.getAllAltFires().first(where: { $0.name == altFireName })?.altFireDescription ?? ""
    }
    
    static private func getAllAltFires() -> [AltFire] {
        var altFires = [AltFire]()
        
        let blastShell = AltFire(name: "Blast Shell", level: 3, altFireDescription: "Lobs a grenade-light projectile that explodes on contact with an enemy, or after enough time has passed.")
        
        let doomBringer = AltFire(name: "Doom Bringer", level: 3, altFireDescription: "A chargeable attack that create a large, slow-moving orb that damages anything near it. Detonates in a large explosion once it hits an enemy, or travels far enough. Can destroy red shields; if it his a shield, it may bounce to a new angle.")
        
        let horizontalBarrage = AltFire(name: "Horizontal Barrage", level: 3, altFireDescription: "Creates a large, horizontal array of projectiles that do modest amounts of damage. If nothing is hit, it will bounce a bit.")
        
        let killSight = AltFire(name: "Killsight", level: 3, altFireDescription: "A sniper-like attack that, if used against the weak spot of an enemy, will do significant amounts of damage.")
        
        let proximityMine = AltFire(name: "Proximity Mine", level: 3, altFireDescription: "Lobs a mine that will explode if an enemy comes close enough to it, or enough time has passed.")
        
        let shieldBreaker = AltFire(name: "Shield Breaker", level: 3, altFireDescription: "A powerful beam that can destroy red shields and damage enemies using them.")
        
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

    private func getWeaponTraits(from weaponName: String) -> [String] {
        if weaponName == "Modified Sidearm SD-M8" {
            return ["Homing Missile", "Ricochet", "Snubnose Barrel", "Piercing", "Burst Fire", "Sharpnel", "Charging Shot", "Serrated Projectiles", "Hit Reload"]
        } else if weaponName == "Tachyomatic Carbine" {
            return ["Armor Piercing", "Critical Hit", "Hardened", "High Caliber", "Rising Pithc", "Payload Rounds", "Leech Rounds", "Hypter-Accurate", "Accelerated"]
        } else if weaponName == "Spitmaw Blaster" {
            return ["Wide Maw", "Narrow Maw", "Slug Shot", "Explosive Spitter", "Rapid Spitter", "Backsplash", "Critical Stagger", "Piercing Spit", "Acid Clouds"]
        } else if weaponName == "Pyroshell Caster" {
            return ["Streamlined Chamber", "Secondary Explosion", "Bouncy Projectiles", "Sticky Bonus", "Seeking Flares", "Enlarged Chamber", "Anti-Gravity Projectiles", "Auxiliary Projectiles", "Simmering Explosion"]
        } else if weaponName == "Coilspine Shredder" {
            return ["Alt-Fire Cooling", "Shattering Discs", "Adrenaline Discs", "Enlarged Chamber", "Twin Discs", "Retarget", "Splitting Discs", "Enhanced Charge", "Negating Discs"]
        } else if weaponName == "Thermogenic Launcher" {
            return ["Easy To Use", "Obolite Magnet", "Critical Rockets", "Enlarged Chamber", "Replicating Hits", "Mega Rocket", "Full Auto", "Thermite Rockets", "Tail Fire"]
        } else if weaponName == "Electropylon Driver" {
            return ["Obolite Extractor", "Silphium Extractor", "Pylon Web", "Finisher", "Streamlined Chamber", "Enlarged Chamber", "Blade Harmonizer", "Blade Pulse", "Protective Pylons"]
        } else if weaponName == "Rotgland Lobber" {
            return ["Durable Rot", "Trailing Rot", "Bouncing Rot", "Enlarged Chamber", "Explosive Rot", "Protective Rot", "Caustic Rot", "Tendril Rot", "Portal Rot"]
        } else if weaponName == "Hollowseeker" {
            return ["Phasing Rounds", "Waves", "Retarget", "Serrated Projectiles", "Sharpnel", "Split Stream", "Portal Beam", "Oscillator", "Portal Turret"]
        } else if weaponName == "Dreadbound" {
            return ["Fourth Shard", "Obolite Magnet", "Staggering", "Proection Steal", "Expanding Shards", "Returning Damage", "Explosive Shards", "Damage Steal", "Obolite Generator"]
        } else {
            return []
        }
    }
}

#Preview {
    AddWeaponView(weapon: .constant(Weapon(name: "Dreadbound", altFire: AltFire(name: "Shieldbreaker", level: 3, altFireDescription: ""), traits: [Trait(name: "Expanding Shards", traitDescription: "", level: 3)], level: 45)))
}
