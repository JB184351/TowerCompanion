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
    let allArtifactNames = [
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
        
        if artifacts.count > 0 {
            Section(header: Text("Artifacts")) {
                ForEach(artifacts, id: \.name) { artifact in
                    Text("\(artifact.name)")
                }
            }
        }
    }
    
    private func addArtifact() {
        for (index, _) in artifactNamesUsedInRun.enumerated() {
            let artifactName = artifactNames[index]
            let artifactDescription = Artifact.getAtrifactDescription(artifactName: artifactName)
            
            let artifact = Artifact(name: artifactName, artifactDescription: artifactDescription)
            artifacts.append(artifact)
            
            artifactNames.removeAll { $0 == artifactNames[index] }
        }
    }
    
    private func clearValues() {
        artifacts.removeAll()
        artifactsUsedInRun.removeAll()
        artifactNames = allArtifactNames
    }
    
}

#Preview {
    AddArtifactsView(artifacts: .constant([Artifact]()))
}
