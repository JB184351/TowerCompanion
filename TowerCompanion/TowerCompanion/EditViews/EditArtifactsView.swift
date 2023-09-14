//
//  EditArtifactsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/13/23.
//

import SwiftUI

struct EditArtifactsView: View {
    @State private var currentlySelectedArtifact = "Adrenaline Coolant"
    @State private var listOfArtifacts: [String] = []
    private var artifactNames: [String] {
        return Artifact.getAllArtifacts().map { $0.name }
    }
    
    @Binding var artifacts: [Artifact]
    
    init(artifacts: Binding<[Artifact]>) {
        self._artifacts = artifacts
    }
    
    var body: some View {
        Section {
            Picker("Artifacts", selection: $currentlySelectedArtifact) {
                ForEach(listOfArtifacts, id: \.self) { artifactName in
                    Text(artifactName).tag(artifactName)
                }
            }
            
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
            
            Section {
                ForEach(artifacts, id: \.name) { artifact in
                    Text(artifact.name)
                }
            } header: {
                artifacts.count > 0 ? Text("Artifacts") : Text("")
            }
        }
        .onAppear {
            if artifacts.count > 0 {
                var allArtifactNames = artifactNames
                
                for artifact in artifacts {
                    if allArtifactNames.contains(artifact.name) {
                        allArtifactNames.removeAll { $0 == artifact.name }
                    }
                }
                
                listOfArtifacts = allArtifactNames
            } else {
                listOfArtifacts = artifactNames
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

//#Preview {
//    EditArtifactsView()
//}
