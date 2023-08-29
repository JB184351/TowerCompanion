//
//  Parasite.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import Foundation

struct Parasite: Codable, Hashable {
    var name: String
    var positiveDescription: String
    var negativeDescription: String
    
    static func getAllParasites() -> [Parasite] {
        var parasites = [Parasite]()
        
        // Only Prefix that can't be used with all suffixes
        let silphic = "Inhibits the use of Silphium resources."
        
        // These suffixes only go with silphic prefix
        let bladeSpinner = "Melee kills repair Integrity."
        let goldSpinner = "Collecting Obolites repairs Integrity."
        
        let silphicBladeSpinner = Parasite(name: "Silphic Bladespinner", positiveDescription: bladeSpinner, negativeDescription: silphic)
        let silphicGoldSpinner = Parasite(name: "Silphic Goldspinner", positiveDescription: goldSpinner, negativeDescription: silphic)
        
        // Found  this one when I was playing on 8/28/2023
        // Not sure if I've seen these prefixes/suffixes with other
        // Parasies, will keep my eyes on it.
        let barbed = "Weapon Damage decreased by 15%."
        let fleshStinger = "Damage dealt to weak points increased by 30%."
        
        let barbedFleshStinger = Parasite(name: "Barbed FleshStinger", positiveDescription: fleshStinger, negativeDescription: barbed)
        
        parasites.append(barbedFleshStinger)
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
    
    static func getAllParasiteNames() -> [String] {
        return getAllParasites().map { $0.name }
    }
}
