//
//  ArtifactView.swift
//  TowerCompanion
//
//  Created by Justin on 6/27/23.
//

import SwiftUI

struct AddArtifactView: View {
    @State private var pickerCount = 1
    @State private var artifactName = ""
    @State private var artifactDescription = ""
    @State private var artifactNamesUsedInRun = [String]()
    @State private var artifactsUsedInRun = [Artifact]()
    
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
    
    
    init() {
        _artifactNamesUsedInRun = State(initialValue: Array(repeating: "", count: pickerCount))
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
        
        Section {
            Button("Add Artifact(s)") {
                addArtifact()
            }
            .disabled(artifactsUsedInRun.count == 15)
            
            Button("Clear All") {
                clearValues()
            }
            .disabled(artifactsUsedInRun.count < 1)
        }
        
        Section(header: Text("Artifacts")) {
            ForEach(artifactsUsedInRun, id: \.name) { artifact in
                Text("\(artifact.name)")
            }
        }
    }
    
    private func addArtifact() {
        for (index, _) in artifactNamesUsedInRun.enumerated() {
            let artifact = Artifact(name: artifactNames[index], artifactDescription: "")
            artifactsUsedInRun.append(artifact)
            
            artifactNames.remove(at: index)
        }
    }
    
    private func clearValues() {
        artifactNamesUsedInRun.removeAll()
        artifactsUsedInRun.removeAll()
    }
    
}

#Preview {
    AddArtifactView()
}
