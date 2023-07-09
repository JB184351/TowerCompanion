//
//  AddParasitesView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/23.
//

import SwiftUI

struct AddParasitesView: View {
    @State private var parasiteName = ""
    @State private var parasitePositiveEffectDescription = "Positive Effect description will go here"
    @State private var parasiteNegativeEffectDescription = "Negative Effect description will go here"
    @State private var numberOfParasites = 1
    @State private var isPlaceHolderEnabled = true
    @State private var parasiteNamesUsedInRun = [String]()
    @State private var pickerCount = 1
    @State private var nonComputedParasiteNames = [String]()
    @State private var isFirstView = false
    @Binding var parasites: [Parasite]
    
    private var parasiteNames: [String] {
        return AddParasitesView.getAllParasiteNames()
    }
    
    init(parasites: Binding<[Parasite]>) {
        _parasiteNamesUsedInRun = State(initialValue: Array(repeating: "", count: 1))
        _nonComputedParasiteNames = State(initialValue: Array(repeating: "", count: 1))
        self._parasites = parasites
    }
    
    var body: some View {
        ForEach(0..<1, id: \.self) { index in
            Picker("Parasites", selection: Binding(
                get: { nonComputedParasiteNames[index] },
                set: { nonComputedParasiteNames[index] = $0 }
            )) {
                ForEach(nonComputedParasiteNames, id:\.self) { parasiteName in
                    Text(parasiteName).tag(parasiteName)
                }
            }
            // Some reason the parasites array gets 1 item
            // inserted so I'm removing it forcibly until I
            // can figure out why that is
            .onAppear {
                if !isFirstView {
                    parasites.removeAll()
                    nonComputedParasiteNames = parasiteNames
                    isFirstView = true
                }
            }
            .onChange(of: nonComputedParasiteNames[index]) {
                isPlaceHolderEnabled = false
                parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: nonComputedParasiteNames[index]).0
                parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: nonComputedParasiteNames[index]).1
            }
        }
        
        Text(parasitePositiveEffectDescription)
            .foregroundStyle(isPlaceHolderEnabled ? .gray.opacity(0.5) : .green)
        Text(parasiteNegativeEffectDescription)
            .foregroundStyle(isPlaceHolderEnabled ? .gray.opacity(0.5) : .red)
        
        Section {
            Button("Add Parasite") {
                addParasite()
            }
            .disabled(parasites.count == 5)
            
            Button("Remove Selected Parasites") {
                clearParasites()
            }
            .disabled(parasites.count < 1)
        }
        
        Section {
            ForEach(parasites, id: \.self) { parasite in
                Text(parasite.name)
                Text(parasite.positiveDescription)
                    .foregroundStyle(.green)
                Text(parasite.negativeDescription)
                    .foregroundStyle(.red)
            }
        } header: {
            Text("Parasites")
        }
        .isHidden(parasites.count < 1)
        
    }
    
    private func addPicker() {
        if !parasitePositiveEffectDescription.isEmpty {
            pickerCount += 1
        } else {
            // MARK: - TODO Add Alert Message Here
            print("We should present an alert here")
        }
    }
    
    private func addParasite() {
        for (index, _) in parasiteNamesUsedInRun.enumerated() {
            let parasite = Parasite(name: nonComputedParasiteNames[index], positiveDescription: parasitePositiveEffectDescription, negativeDescription: parasiteNegativeEffectDescription)
            parasites.append(parasite)
            
            nonComputedParasiteNames.remove(at: index)
        }
    }
    
    private func clearParasites() {
        parasites.removeAll()
        nonComputedParasiteNames = parasiteNames
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
        let parasites = AddParasitesView.getAllParasites()
        
        guard let parasite = parasites.first(where: { $0.name == parasiteName }) else { return ("Cannot get positive effect", "Cannot get negative effect") }
        
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
}

#Preview {
    AddParasitesView(parasites: .constant([Parasite]()))
}
