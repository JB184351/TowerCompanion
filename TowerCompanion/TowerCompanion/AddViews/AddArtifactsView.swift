//
//  ArtifactView.swift
//  TowerCompanion
//
//  Created by Justin on 6/27/23.
//

import SwiftUI

struct AddArtifactsView: View {
    @State private var artifactName = ""
    @State private var artifactDescription = ""
    @State private var artifactNamesUsedInRun = [String]()
    @State private var artifactsUsedInRun = [Artifact]()
    @State private var isFirstView = false
    @Binding var artifacts: [Artifact]
    
    @State var artifactNames = [
        "Phantom Limb",
        "Wound Seekers",
        "Execution Rush",
        "Recharging Overload",
        "Fractal Nail",
        "Silver Lattice",
        "Adrenaline Coolant",
        "Disrupting Overloads",
        "Blown Nightlight",
        "Golden Coil",
        "Recharging Response",
        "Energy Manipulator",
        "Resinous Shield",
        "Reactive Stabilizers",
        "Repair Circuit",
        "Adrenaline Enhancer",
        "Progenitor Egg",
        "Resin Enhancer",
        "Execution Coolant",
        "Murmuring Cocoon",
        "Pulsating Mass",
        "Unified Pod"
    ]
    
    
    init(artifacts: Binding<[Artifact]>) {
        _artifactNamesUsedInRun = State(initialValue: Array(repeating: "", count: 1))
        self._artifacts = artifacts
    }
    
    var body: some View {
        Section {
            ForEach(0..<1, id: \.self) { index in
                Picker("Select an item", selection: Binding(
                    get: { artifactNames[index] },
                    set: { artifactNames[index] = $0 }
                )) {
                    ForEach(artifactNames, id: \.self) { artifactName in
                        Text(artifactName).tag(artifactName)
                    }
                }
            }
        }
        .onAppear {
            // Some reason the artifacts array gets 1 item
            // inserted so I'm removing it forcibly until I
            // can figure out why that is
            if !isFirstView {
                artifacts.removeAll()
                isFirstView = true
            }
        }
        
        Section {
            Button("Add Artifact(s)") {
                withAnimation {
                    addArtifact()
                }
            }
            .disabled(artifacts.count == 15)
            
            Button("Clear All") {
                withAnimation {
                    clearValues()
                }
            }
            .disabled(artifacts.count < 1)
        }
        
        Section(header: Text("Artifacts")) {
            ForEach(artifacts, id: \.name) { artifact in
                Text("\(artifact.name)")
            }
        }
        .isHidden(artifacts.count == 0)
    }
    
    private func addArtifact() {
        for (index, _) in artifactNamesUsedInRun.enumerated() {
            let artifact = Artifact(name: artifactNames[index], artifactDescription: "")
            artifacts.append(artifact)
            
            artifactNames.remove(at: index)
        }
    }
    
    private func clearValues() {
        artifacts.removeAll()
        artifactsUsedInRun.removeAll()
    }
    
    private func getAllAtrifactDescriptions(artifactName: String) -> String {
        switch artifactName {
        case "Phantom Limb":
            return "While equipped, each kill has a 10% chance of healing you."
        case "Wound Seekers":
            return "Deal 30% more damage to low health targets."
        case "Execution Rush":
            return "Melee kills briefly increases Speed by 25% & Protection by 25%"
        case "Recharging Overload":
            return "Successful Overloads reduce Alt-Fire Cooldown by 3s."
        case "Fractal Nail":
            return "Grants +10% Weapon Damage while you have a Malfunction."
        case "Silver Lattice":
            return "Grants Immunity to slowdown effects."
        case "Adrenaline Coolant":
            return "Reduce Alt-Fire Cooldown by 1s per Adrenaline Level."
        case "Blown Nightlight":
            return "Personal item. Being at full or low Integrity increases weapon damage by 10%."
        case "Golden Coil":
            return "Grants +5% Weapon Damage for every 200 Obolites carries. Max bonus: 15%."
        case "Disrupting Overloads":
            return "Successful Overloads cause weapon fire to break Shields for 3 seconds."
        case "Recharging Response":
            return "Getting hit reduces Alt-Fire Cooldown by 5 seconds."
        case "Energy Manipulator":
            return "Using a Consumable briefly increases Protection by 10%"
        case "Resinous Shield":
            return "Picking up a Resin gives a shield against the next hit."
        case "Reactive Stabilizers":
            return "95% chance to avoid being knocked down  by heavy attacks."
        case "Repair Circuit":
            return "Gaining or fixing Malfunctions repairs Integrity."
        case "Adrenaline Enhancer":
            return "Take one additional hit before Adrenaline Levels drop."
        case "Progenitor Egg":
            return "Attaching or detaching Parasites repairs integrity."
        case "Resin Enhancer":
            return "Reduces the number of Resins needed to upgrade Max Integrity."
        case "Execution Coolant":
            return "Melee kills reduce Alt-Fire Cooldown by 5s."
        case "Murmuring Cocoon":
            return "Increases the positive effects of parasites."
        case "Pulsating Mass":
            return "Attaching or detaching Parasites improves Max Integrity"
        case "Unified Pod":
            return "Grants +20% stagger power for each attached Parasite."
        default:
            return ""
        }
    }
    
}

#Preview {
    AddArtifactsView(artifacts: .constant([Artifact]()))
}
