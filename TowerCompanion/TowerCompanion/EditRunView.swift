//
//  AddRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/21/23.
//

import SwiftUI

struct EditRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var towerRun: TowerRun

    private let platforms = ["PS5", "PC"]
    private let weaponNames = ["Modified Sidearm SD-M8", "Hollowseeker", "Electropylon Launcher", "Rotgland Lobber", "Pyroshell Caster", "Thermogenic Launcher", "Dreadbound", "Coilspine Shredder", "Tachyomatic Carbine", "Spitmaw Blaster"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section {
                        TextField("Enter Scout Name", text: $towerRun.scoutName)
                        Picker("Select Platform", selection: $towerRun.platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    } header: {
                        Text("Enter Scout Name")
                    }
                    
                    // MARK: - Weapon and weapon details
                    Section {
                        TextField("Weapon Name", text: $towerRun.weapon.name)
                        
                        Picker("Weapon Name", selection: $towerRun.weapon.name) {
                            ForEach(weaponNames, id: \.self) { weaponName in
                                Text("\(weaponName)").tag(weaponName)
                            }
                        }
                        
                        Picker("Weapon Level", selection: $towerRun.weapon.level) {
                            ForEach(1..<46) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        
                        TextField("Weapon Alt-Fire", text: $towerRun.weapon.altFire.name)
                        
                        Picker("Weapon Alt-Fire Level", selection: $towerRun.weapon.altFire.level) {
                            ForEach(1..<4) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[0].name)
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[1].name)
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[2].name)
                        
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    // MARK: - Artifacts
                    Section {
                        TextField("Artifact Name", text: $towerRun.artifacts[0].name)
                        TextField("Artifact Description", text: $towerRun.artifacts[0].artifactDescription)
                    } header: {
                        Text("Enter Artifacts")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        TextField("Parasite Name", text: $towerRun.parasites[0].name)
                        TextField("Parasite Positive Effect", text: $towerRun.parasites[0].positiveDescription)
                        TextField("Parasite Negative Effect", text: $towerRun.parasites[0].negativeDescription)
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // MARK: - Stats
                    Section {
                        TextField("Weapon Damage", value: $towerRun.stats[0].weaponDamage, format: .percent)
                        TextField("Protection", value: $towerRun.stats[1].protection, format: .percent)
                        TextField("Profiency Rate", value: $towerRun.stats[2].profiencyRate, format: .percent)
                        TextField("Repair Effiency", value: $towerRun.stats[3].repairEffiency, format: .percent)
                        TextField("Alt-Fire Cooldown", value: $towerRun.stats[4].altFireCoolDown, format: .percent)
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section {
                        TextField("Malfunction Description", text: $towerRun.malfunctions[0].malfunctionDescription)
                        TextField("Malfunction Remove Condition", text: $towerRun.malfunctions[0].conditionToRemove)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $towerRun.score, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Mutliplier", value: $towerRun.multiplier, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Average Multiplier", value: $towerRun.averageMultiplier, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $towerRun.phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Room", value: $towerRun.room, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Date completed
                    Section {
                        DatePicker("", selection: $towerRun.dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Enter The Date and Time Information")
                    }
                }
            }
        }
        Button("Done") {
            modelContext.insert(towerRun)
            dismiss()
        }
    }
    
    private func getAllParasites() -> [Parasite] {
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
    
    private func getAllArtifacts() -> [Artifact] {
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
    
    private func getAllAltFires() -> [AltFire] {
        var altFires = [AltFire]()
        
        return altFires
    }
        
}

//#Preview {
//    AddRunView(towerRun: <#TowerRun#>)
//        .modelContainer(for: TowerRun.self)
//}
