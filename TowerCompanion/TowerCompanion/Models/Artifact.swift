//
//  Artifact.swift
//  TowerCompanion
//
//  Created by Justin on 6/14/23.
//

import Foundation

struct Artifact: Codable, Hashable {
    var name: String
    var artifactDescription: String
    
    static func getAllArtifacts() -> [Artifact] {
        var artifacts = [Artifact]()
        
        let phantomLimb = Artifact(name: "Phantom Limb", artifactDescription: "Eliminating hostiles has a 10% chance to repair Integrity.")
        let woundSeekers = Artifact(name: "Wound Seekers", artifactDescription: "Deal 30% more damage to low health targets.")
        let executionRush = Artifact(name: "Execution Rush", artifactDescription: "Melee kills briefly increase Speed & Protection by 25%.")
        let rechargingOverload = Artifact(name: "Recharging Overload", artifactDescription: "Successful Overlaods reduce Alt-Fire Cooldown by 3s.")
        let fractalNail = Artifact(name: "Fractal Nail", artifactDescription: "Grants +10% Weapon Damage while you have a Malfunction.")
        let silverLattice = Artifact(name: "Silver Lattice", artifactDescription: "Become immune to slowdown effects.")
        let adrenalineCoolant = Artifact(name: "Adrenaline Coolant", artifactDescription: "Reduce Alt-Fire Cooldown by 1s per Adrenaline Level.")
        let disruptingOverload = Artifact(name: "Disrupting Overload", artifactDescription: "Successful Overloads cause weapon fire to break Shields for 6s.")
        let blownNightlight = Artifact(name: "Blown Nightlight", artifactDescription: "Personal Item. Being a Full or Low Integrity increase Weapon Damage by 10%.")
        let goldenCoil = Artifact(name: "Golden Coil", artifactDescription: "Grants +5% Weapon Damage for every 200 Obolites carried.\nMaximum Bonus 15%")
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
        
        artifacts.sort { $0.name < $1.name }
        
        return artifacts
    }
}

