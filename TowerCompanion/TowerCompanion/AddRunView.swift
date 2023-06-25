//
//  AddRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/23/23.
//

import SwiftUI

struct AddRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var scoutName = ""
    @State private var platform = ""
    private let platforms = ["PS5", "PC"]
    
    // Weapon Related Variables
    @State private var weaponName = ""
    @State private var weaponLevel = 0
    @State private var altFireName = ""
    @State private var altFireLevel = 0
    @State private var altFIreDescription = ""
    @State private var weaponTraitNames = [String]()
    @State private var weaponTraitLevel = 1
    
    private let weaponNames = ["Modified Sidearm SD-M8", "Hollowseeker", "Electropylon Launcher", "Rotgland Lobber", "Pyroshell Caster", "Thermogenic Launcher", "Dreadbound", "Coilspine Shredder", "Tachyomatic Carbine", "Spitmaw Blaster"]
    
    var altFires: [AltFire] {
        return AddRunView.getAllAltFires()
    }
    
    // Artifacts
    @State private var artifactName = ""
    @State private var artifactDescription = ""
    
    var artifactNames: [String] {
        return AddRunView.getAllArtifactNames()
    }
    
    // Parasites
    @State private var parasiteName = ""
    @State private var parasitePositiveEffectDescription = "Positive Effect description will go here"
    @State private var parasiteNegativeEffectDescription = "Negative Effect description will go here"
    @State private var numberOfParasites = 1
    @State private var isPlacerHolderTextForParasiteDescriptions = true
    
    private var parasiteNames: [String] {
        return AddRunView.getAllParasiteNames()
    }
    
    // Stats
    @State private var weaponDamageStat = 0.0
    @State private var protectionStat = 0.0
    @State private var profiencyRate = 0.0
    @State private var repairEffiency = 0.0
    @State private var altFireCooldown = 0.0
    
    // Malfunctions
    @State private var malfunctionDescription = ""
    @State private var malfunctionRemoveCondition = ""
    
    // Score Related Variables
    @State private var score = 0
    @State private var multiplier = 0.0
    @State private var averageMutliplier = 0.0
    @State private var highestMultplier = 0.0
    
    // Phase and Room
    @State private var phase = 0
    @State private var room = 0
    
    // Date
    @State private var dateCompleted = Date.now
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section {
                        TextField("Enter Scout Name", text: $scoutName)
                        Picker("Select Platform", selection: $platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    } header: {
                        Text("Enter Scout Name")
                    }
                    
                    // MARK: - Weapon and weapon details
                    Section {
                        Picker("Weapon Name", selection: $weaponName) {
                            ForEach(weaponNames, id: \.self) { weaponName in
                                Text("\(weaponName)").tag(weaponName)
                            }
                        }
                        
                        Picker("Weapon Level", selection: $weaponLevel) {
                            ForEach(1..<46) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        Picker("Weapon Alt-Fire", selection: $altFireName) {
                            ForEach(altFires, id: \.self) { altFire in
                                Text(altFire.name).tag(altFire.name)
                            }
                        }
                        
                        Picker("Weapon Alt-Fire Level", selection: $altFireLevel) {
                            ForEach(1..<4) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        // MARK: - TODO
                        // Add Weapon Trait Selection Based on Weapon Selection
//                        Picker("Weapon Traits", selection: $weaponTraits) {
//                            ForEach(weaponTraits, id: \.self) { weaponTrait in
//                                Text(weaponTrait).tag(weaponTrait)
//                            }
//                        }
//                        .onChange(of: $weaponName) { oldValue, newValue in
//                            weaponTraits = getWeaponTraits(from: weaponName)
//                        }
                        
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    // MARK: - Artifacts
                    Section {
                        Picker("Artifacts", selection: $artifactName) {
                            ForEach(artifactNames, id:\.self) { artifactName in
                                Text(artifactName).tag(artifactName)
                            }
                        }
                    } header: {
                        Text("Enter Artifacts")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        Picker("Parasites", selection: $parasiteName) {
                            ForEach(parasiteNames, id:\.self) { parasiteName in
                                Text(parasiteName).tag(parasiteName)
                            }
                        }
                        .onChange(of: parasiteName) {
                            isPlacerHolderTextForParasiteDescriptions = false
                            parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: parasiteName).0
                            parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: parasiteName).1
                        }
                        
                        Text(parasitePositiveEffectDescription)
                            .foregroundStyle(isPlacerHolderTextForParasiteDescriptions ? .gray.opacity(0.5) : .black)
                        Text(parasiteNegativeEffectDescription)
                            .foregroundStyle(isPlacerHolderTextForParasiteDescriptions ? .gray.opacity(0.5) : .black)
                        
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: 0...150, step: 5)
                        Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: 0...150, step: 5)
                        Stepper("Repair Effiency \(repairEffiency.formatted())%", value: $repairEffiency, in: 0...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted())%", value: $altFireCooldown, in: 0...150, step: 5)
                        Stepper("Profiency Rate \(profiencyRate.formatted())%", value: $profiencyRate, in: 0...150, step: 5)
                        
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section {
                        TextField("Malfunction Description", text: $malfunctionDescription)
                        TextField("Malfunction Remove Condition", text: $malfunctionRemoveCondition)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $score, format: .number)
                            .keyboardType(.numberPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Mutliplier", value: $multiplier, format: .percent)
                            .keyboardType(.decimalPad)
                        TextField("Average Multiplier", value: $averageMutliplier, format: .percent)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Room", value: $room, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Date completed
                    Section {
                        DatePicker("", selection: $dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Enter The Date and Time Information")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Add") {
                        addTowerRun()
                        dismiss()
                    }
                }
            }
        }
    }
    
    static private func getAllParasites() -> [Parasite] {
        var parasites = [Parasite]()
        
        // MARK: - TODO
        // Add Rest of Parasites, maybe look into a more efficient way to do this so it looks nice ;)
        let benignScabshell = Parasite(name: "Benign Scabshell", positiveDescription: "Increases protection by 15%", negativeDescription: "No negative effects detected.")
        let benignRotnose = Parasite(name: "Benign Rotnose", positiveDescription: "50% chance to find better salvage from hostiles", negativeDescription: "No negative effects detected.")
        let destablilizingFirespur = Parasite(name: "Destabilizing Firespur", positiveDescription: "Each room cleared increases Weapon Damage by 2%./n Maximum 20%.", negativeDescription: "Dropped Obolites disappear 1s faster.")
        let barbedHuskweaver = Parasite(name: "Barbed Huskweaver", positiveDescription: "Greatly increases Max Integrity.", negativeDescription: "Weapon Damage decreasd by 15%.")
        let constrictingSagetooth = Parasite(name: "Constricting Sagetooth", positiveDescription: "Increases Proficiency Rate by 20%.", negativeDescription: "Suffer damage when picking up items.")
        let latchingOddkeeper = Parasite(name: "Latching Oddkeeper", positiveDescription: "20% chance to not lose a Consumable on use.", negativeDescription: "Suffer damage when using Atropian Keys.")
        let atrophyingWireseker = Parasite(name: "Atrophying Wireseeker", positiveDescription: "Fixes or prevents x1 Malfunction, detaaches afterwards.", negativeDescription: "Reduces Melee Damage by 50%.")
        
        parasites.append(benignScabshell)
        parasites.append(benignRotnose)
        parasites.append(destablilizingFirespur)
        parasites.append(barbedHuskweaver)
        parasites.append(constrictingSagetooth)
        parasites.append(latchingOddkeeper)
        parasites.append(atrophyingWireseker)
        
        return parasites
    }
    
    private func getParasiteEffectDescriptions(parasiteName: String) -> (String, String) {
        let parasites = AddRunView.getAllParasites()
        
        let parasite = parasites.first(where: { $0.name == parasiteName })!
        
        return (parasite.positiveDescription, parasite.negativeDescription)
    }
    
    static private func getAllParasiteNames() -> [String] {
        var parasiteNames = [String]()
        
        let parasites = getAllParasites()
        
        for parasite in parasites {
            parasiteNames.append(parasite.name)
        }
        
        return parasiteNames
    }
    
    static private func getAllArtifacts() -> [Artifact] {
        var artifacts = [Artifact]()
        
        let phantomLimb = Artifact(name: "Phantom Limb", artifactDescription: "Eliminating hostiles has a 10% chance to repair Integrity.")
        let woundSeekers = Artifact(name: "Wound Seekers", artifactDescription: "Deal 30% more damage to low health targets.")
        let executionRush = Artifact(name: "Execution Rush", artifactDescription: "Melee kills briefly increase Speed by 25% & Protection by 25%.")
        let rechargingOverload = Artifact(name: "Recharging Overload", artifactDescription: "Successful Overlaods reduce Alt-Fire Cooldown by 3s.")
        let fractalNail = Artifact(name: "Fractal Nail", artifactDescription: "Grants +10% Weapon Damage while you have a Malfunction.")
        let silverLattice = Artifact(name: "Silver Lattice", artifactDescription: "Become immune to slowdown effects.")
        let adrenalineCoolant = Artifact(name: "Adrenaline Coolant", artifactDescription: "Reduce Alt-Fire Cooldown by 1s per Adrenaline Level.")
        let disruptingOverload = Artifact(name: "Disrupting Overloads", artifactDescription: "Successful Overloads cause weapon fire to break Shields for 6s.")
        let blownNightlight = Artifact(name: "Blown Night", artifactDescription: "Personal Item. Being a Full or Low Integrity increase Weapon Damage by 10%.")
        let goldenCoil = Artifact(name: "Golden Coil", artifactDescription: "Grants +5% Weapon Damage for every 200 Obolites carried./n Maximum Bonus 15%")
        let rechargingResponse = Artifact(name: "Recharging Response", artifactDescription: "Getting hit reduces Alt-Fire Cooldown by 5s.")
        let energyManipulator = Artifact(name: "Energy Manipulator", artifactDescription: "Using a Consumable briefly increases Protection by 10%.")
        let resinousShield = Artifact(name: "Resinous Shield", artifactDescription: "Picking up a Resin gives you a Shield against the next hit.")
        let reactiveStabilizers = Artifact(name: "Reactive Stabilizers", artifactDescription: "95% chance to avoid being knocked down by heavy attacks.")
        let repairCircuit = Artifact(name: "Repair Circuit", artifactDescription: "Gaining or fixing Malfunctions repairs Integrity.")
        let adrenalineEnhancer = Artifact(name: "Adrenaline Enhancer", artifactDescription: "Take on additional hit before Adrenaline Levels drop.")
        let progenitorEgg = Artifact(name: "Progenitor Egg", artifactDescription: "Attaching or detaching Parasites repairs Integrity.")
        let resinEnhancer = Artifact(name: "Resin Enhancer", artifactDescription: "Reduces the number of Resins needed to upgrade Max Integrity.")
        let executionCoolant = Artifact(name: "Execution Coolant", artifactDescription: "Melee reduce Alt-Fire Cooldown by 5s.")
        let murmuringCocoon = Artifact(name: "Murmuring Cocoon", artifactDescription: "Boosts the positive effecs of upcoming Parasites.")
        let pulsatingMass = Artifact(name: "Pulsating Mass", artifactDescription: "Increases Maximum Integrity upon attaching or detaching a Parasite")
        let unifiedPod = Artifact(name: "Unified Pod", artifactDescription: "Adds 20% Stagger Power for each Parasite attached.")
        
        artifacts.append(phantomLimb)
        artifacts.append(woundSeekers)
        artifacts.append(executionRush)
        artifacts.append(rechargingOverload)
        artifacts.append(fractalNail)
        artifacts.append(silverLattice)
        artifacts.append(adrenalineCoolant)
        artifacts.append(disruptingOverload)
        artifacts.append(blownNightlight)
        artifacts.append(goldenCoil)
        artifacts.append(rechargingResponse)
        artifacts.append(energyManipulator)
        artifacts.append(resinousShield)
        artifacts.append(reactiveStabilizers)
        artifacts.append(repairCircuit)
        artifacts.append(adrenalineEnhancer)
        artifacts.append(progenitorEgg)
        artifacts.append(resinEnhancer)
        artifacts.append(executionCoolant)
        artifacts.append(murmuringCocoon)
        artifacts.append(pulsatingMass)
        artifacts.append(unifiedPod)
        
        
        return artifacts
    }
    
    static private func getAllArtifactNames() -> [String] {
        var artifactNames = [String]()
        
        for artifact in getAllArtifacts() {
            artifactNames.append(artifact.name)
        }
        
        return artifactNames
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
        } else if weaponName == "HollowSeeker" {
            return ["Phasing Rounds", "Waves", "Retarget", "Serrated Projectiles", "Sharpnel", "Split Stream", "Portal Beam", "Oscillator", "Portal Turret"]
        } else if weaponName == "Dreadbound" {
            return ["Fourth Shard", "Obolite Magnet", "Staggering", "Proection Steal", "Expanding Shards", "Returning Damage", "Explosive Shards", "Damage Steal", "Obolite Generator"]
        } else {
            return []
        }
    }
    
    func addTowerRun() {
        let altFire = AltFire(name: altFireName, level: altFireLevel, altFireDescription: altFIreDescription)
        
        var weaponTraits = [Trait]()
        
        for weaponTraitName in weaponTraitNames {
            let weaponTrait = Trait(name: weaponTraitName, traitDescription: "", level: weaponTraitLevel)
            weaponTraits.append(weaponTrait)
        }
        
        let weapon = Weapon(name: weaponName, altFire: altFire, traits: weaponTraits, level: weaponLevel)
        
        var artifacts = [Artifact]()
        
        for artifactName in artifactNames {
            let artifact = Artifact(name: artifactName, artifactDescription: "")
            artifacts.append(artifact)
        }
        
        var parasites = [Parasite]()
        
        let parasite = Parasite(name: parasiteName, positiveDescription: parasitePositiveEffectDescription, negativeDescription: parasiteNegativeEffectDescription)
        parasites.append(parasite)
        
        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, profiencyRate: profiencyRate, repairEffiency: repairEffiency, altFireCoolDown: altFireCooldown)
        
        var malfunctions = [Malfunction]()
        let malfunction = Malfunction(malfunctionDescription: malfunctionDescription, conditionToRemove: malfunctionRemoveCondition)
        malfunctions.append(malfunction)
        
        let towerRun = TowerRun(scoutName: scoutName, weapon: weapon, artifacts: artifacts, parasites: parasites, stats: stats, malfunctions: malfunctions, score: score, multiplier: multiplier, averageMultiplier: averageMutliplier, highestMultplier: highestMultplier, phase: phase, room: room, platform: platform, dateCompleted: dateCompleted)
        
        modelContext.insert(towerRun)
    }
    
}

#Preview {
    AddRunView()
        .modelContainer(for: TowerRun.self)
}
