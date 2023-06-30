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
                        Text("Enter Scout Details")
                    }
                    
                    // MARK: - Weapon
                    Section {
                        AddWeaponView()
                    } header: {
                        Text("Add Weapon Details")
                    }
                    
                    // MARK: - Artifact View
                    Section {
                        AddArtifactView()
                    } header: {
                        Text("Add Aritfacts Here (Can Add Up To 15)")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        AddParasitesView()
                    } header: {
                        Text("Add Parasite(s) (Can Add Up to 5)")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: -150...150, step: 5)
                        Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: -150...150, step: 5)
                        Stepper("Repair Effiency \(repairEffiency.formatted())%", value: $repairEffiency, in: -150...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted()) seconds", value: $altFireCooldown, in: -150...150, step: 5)
                        Stepper("Profiency Rate \(profiencyRate.formatted())%", value: $profiencyRate, in: -150...150, step: 5)
                        
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
//                        addTowerRun()
                        dismiss()
                    }
                }
            }
        }
    }
    
    /*
    func addTowerRun() {
        let altFire = AltFire(name: altFireName, level: altFireLevel, altFireDescription: altFIreDescription)
        
        var weaponTraits = [Trait]()
        
        for weaponTraitName in weaponTraitNames {
            let weaponTrait = Trait(name: weaponTraitName, traitDescription: "", level: weaponTraitLevel)
            weaponTraits.append(weaponTrait)
        }
        
        let weapon = Weapon(name: weaponName, altFire: altFire, traits: weaponTraits, level: weaponLevel)
        
        var artifacts = [Artifact]()
        
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
     */
    
}

#Preview {
    AddRunView()
        .modelContainer(for: TowerRun.self)
}

