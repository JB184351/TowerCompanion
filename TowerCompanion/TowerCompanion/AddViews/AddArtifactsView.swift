//
//  ArtifactView.swift
//  TowerCompanion
//
//  Created by Justin on 6/27/23.
//

import SwiftUI

struct AddArtifactsView: View {
    @State private var artifactsUsedInRun = [Artifact]()
    @State private var isFirstView = false
    @State private var currentlySelectedArtifact = "Adrenaline Coolant"
    @State private var listOfArtifacts: [String] = []
    @Binding var artifacts: [Artifact]
    
    init(artifacts: Binding<[Artifact]>) {
        self._artifacts = artifacts
    }
    
    var artifactNames: [String] {
        return Artifact.getAllArtifacts().map { $0.name }
    }
    
    var body: some View {
        Section {
            Picker("Artifacts", selection: $currentlySelectedArtifact) {
                ForEach(listOfArtifacts, id: \.self) { artifactName in
                    Text(artifactName).tag(artifactName)
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
            
            listOfArtifacts = artifactNames
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
        let artifactDescription = Artifact.getAllArtifacts().filter( { $0.name == currentlySelectedArtifact }).description
        let artifact = Artifact(name: currentlySelectedArtifact, artifactDescription: artifactDescription)
        
        artifacts.append(artifact)
        listOfArtifacts.removeAll(where: { $0 == currentlySelectedArtifact })
        currentlySelectedArtifact = listOfArtifacts[0]
    }
    
    private func clearValues() {
        artifacts.removeAll()
        listOfArtifacts = artifactNames
        currentlySelectedArtifact = listOfArtifacts[0]
    }
    
}

#Preview {
    AddArtifactsView(artifacts: .constant([Artifact]()))
}
