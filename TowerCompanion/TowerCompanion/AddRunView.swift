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
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted())%", value: $altFireCooldown, in: -150...150, step: 5)
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
    
    static private func getAllParasites() -> [Parasite] {
        var parasites = [Parasite]()
        
        // Only Prefix that can't be used with all suffixes
        let silphic = "Inhibits the use of Silphium resources."
        
        // These suffixes only go with silphic prefix
        let bladeSpinner = "Melee kills repair Integrity."
        let goldSpinner = "Collecting Obolites repairs Integrity."
        
        let silphicBladeSpinner = Parasite(name: "Silphic Bladespinner", positiveDescription: bladeSpinner, negativeDescription: silphic)
        let silphicGoldSpinner = Parasite(name: "Silphic Goldspinner", positiveDescription: goldSpinner, negativeDescription: silphic)
        
        parasites.append(silphicGoldSpinner)
        parasites.append(silphicBladeSpinner)
        
        // MARK: - Negative Prefixes (Passive)
        let atrophing = ["Atrophing" : "Reduces Melee Damage by 50%."]
        let brittle = ["Brittle" : "Suffer damage from long falls."]
        let caustic = ["Caustic" : "Hostiles leave behind a pool of acid on death."]
        let constricting = ["Constricting" : "Causes damage when picking up Items."]
        let corrosive = ["Corrosive" : "Reduces Protection by 10%."]
        let destabilizing = ["Destabilizing" : "Dropped Obolites disappear 1s faster."]
        let distracting = ["Distracting" : "Reduces Proficiency Rate by 15%."]
        let impairing = ["Impairing" : "Reduces Repair Efficiency by 30%."]
        let latching = ["Latching" : "Suffer damage when using Keys."]
        let lethargic = ["Lethargic" : "Alt-Fire Cooldown increased by 5s."]
        let malicious = ["Malicious" : "Increases Malfunction probability."]
        let oily = ["Oily" : "Upcoming Malfunctions have harder fix requirements."]
        let ominous = ["Ominous" : "Increases the chance of finding Malignant Items."]
        let sedating = ["Sedating" : "1 more kill required to increase Adrenaline Levels."]
        let slimy = ["Slimy" : "Upcoming Malfunctions have more severe effects."]
        let sluggish = ["Sluggish" : "Greatly increases Melee Cooldown & Dash Cooldown"]
        let benign = ["Benign" : "No negative effects detected."]
        
        // MARK: - Positive Suffixes (Passive)
        let coldblood = ["Coldblood" : "Reduces Alt-Fire Cooldown by 3s."]
        let goldStalker = ["Goldstalker" : "Doubles Obolite collection radius."]
        let goldTail = ["Goldtail" : "Dropped Obolites last 1.5s longer."]
        let huskweaver = ["Huskweaver" : "Greatly increases Max Integrity."]
        let needletooth = ["Needletooth" : "Increases Repair Efficiency by 20%."]
        let nervesStinger = ["Nervestinger" : "1 fewer kill required to increase Adrenaline Levels."]
        let oddkeeper = ["Oddkeeper" : "20% chance to not lose a Consumable on use."]
        let rotnose = ["Rotnose" : "50% chance to find better Salvage from hostiles."]
        let rotstench = ["Rotstench" : "Find Salvage from hostiles more often."]
        let sageTooth = ["Sagetooth" : "Increases Proficiency Rate by 20%."]
        let scabshell = ["Scabshell" : "Increases Protection by 15%."]
        let silverscale = ["Silverscale" : "Fabrication costs reduced by 15%."]
        let slowstich = ["Slowstich" : "Autorepairs while at Low Integrity."]
        let wiretail = ["Wiretail" : "Reduces Malfunction probability."]
        
        let negativePassivePrefixes: [[String : String]] = [atrophing, brittle, caustic, constricting, corrosive, destabilizing, distracting, impairing, latching, lethargic, malicious, oily, ominous, sedating, slimy, sluggish, benign]
        let positivePassiveSuffixes: [[String: String]] = [coldblood, goldStalker, goldTail, huskweaver, needletooth, nervesStinger, oddkeeper, rotnose, rotstench, sageTooth, scabshell, silverscale, slowstich, wiretail]
        
        for negativePassivePrefix in negativePassivePrefixes {
            for positivePassiveSuffix in positivePassiveSuffixes {
                for negativeKey in negativePassivePrefix {
                    for positiveKey in positivePassiveSuffix {
                        let parasiteName = negativeKey.key + " " + positiveKey.key
                        let parasite = Parasite(name: parasiteName, positiveDescription: positiveKey.value, negativeDescription: negativeKey.value)
                        parasites.append(parasite)
                    }
                }
            }
        }
        
        
        // Following Prefixes and Suffixes can only go with each other
        // Active Affixes
        
        // Prefixes
        let amnesic = ["Amenesic" : "Eats away a large amount of Proficiency on detach."]
        let festering = ["Festering" : "Suffer damage to Integrity on detach."]
        let jolting = ["Jolting" : "Triggers 2 Malfunctions on detach."]
        let rupturing = ["Rupturing" : "Greatly reduces Max Integrity on detach."]
        let shocking = ["Shocking" : "Triggers a Critical Malfunction on detach."]
        let sparking = ["Sparking" : "Things"]
        
        // Suffixes
        let firestinger = ["Firestinger" : "Increases Speed and Weapon Damage by 25% for the next 15 kills, detaches afterward."]
        let lockerfeeder = ["Lockfeeder" : "Allows a Key to be reused, detaches after first use."]
        let rotskin = ["Rotskin" : "Earn Salvage from the next 3 kills, detaches afterwards."]
        let scrapfeeder = ["Scrapfeeder" : "Allows a consumable to be reused, deatches after first use"]
        let shatterskin = ["Shatterskin" : "Survive a killing blow, detaches afterwards"]
        let silverskin = ["Silverskin" : "Discounts one item by 30%, detaches afterwards."]
        let wireseeker = ["Wireseeker" : "Prevents an upcoming Malfunction or removes an existing Malfunction once, detaches afterward."]
        
        let negativeActivePrefixes: [[String: String]] = [amnesic, festering, jolting, rupturing, shocking, sparking]
        let positiveActiveSuffixes: [[String: String]] = [firestinger, lockerfeeder, rotskin, scrapfeeder, shatterskin, silverskin, wireseeker]
        
        for negativeActivePrefix in negativeActivePrefixes {
            for positiveActiveSuffix in positiveActiveSuffixes {
                for negativeKey in negativeActivePrefix {
                    for positiveKey in positiveActiveSuffix {
                        let parasiteName = negativeKey.key + " " + positiveKey.key
                        let parasite = Parasite(name: parasiteName, positiveDescription: positiveKey.value, negativeDescription: negativeKey.value)
                        parasites.append(parasite)
                    }
                }
            }
        }
        
        parasites.sort { $0.name < $1.name }
        
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

