//
//  ArtifactView.swift
//  TowerCompanion
//
//  Created by Justin on 6/27/23.
//

import SwiftUI

struct AddArtifactsView: View {
    @State private var currentlySelectedArtifact = "Adrenaline Coolant"
    @State private var listOfArtifacts: [String] = []
    @State private var isFirstView = false
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
        }
        
        if artifacts.count > 0 {
            Section(header: Text("Artifacts")) {
                ForEach(artifacts, id: \.name) { artifact in
                    Text("\(artifact.name)")
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        removeArtifactFromList(index: index)
                    }
                })
            }
        }
    }
    
    private func addArtifact() {
        var artifactDescription = ""
        if let description = Artifact.getAllArtifacts().first(where: { $0.name == currentlySelectedArtifact })?.artifactDescription {
            artifactDescription = description
        } else {
            artifactDescription = "Description can't be found"
        }
        
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
    
    private func removeArtifactFromList(index: Int) {
        let artifact = artifacts[index]
        artifacts.remove(at: index)
        listOfArtifacts.append(artifact.name)
        listOfArtifacts.sort(by: { $0 < $1 })
        currentlySelectedArtifact = listOfArtifacts[0]
    }
}

#Preview {
    AddArtifactsView(artifacts: .constant([Artifact]()))
}
