//
//  AddParasitesView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/23.
//

import SwiftUI

struct AddParasitesView: View {
    @State private var parasitePositiveEffectDescription = "Positive Effect description will go here"
    @State private var parasiteNegativeEffectDescription = "Negative Effect description will go here"
    @State private var currentlySelectedParasiteName = "Amenesic Firestinger"
    @State private var allParasiteNames: [String] = []
    @State private var isFirstView = true
    @Binding var parasites: [Parasite]
    
    private var parasiteNames: [String] {
        return Parasite.getAllParasiteNames()
    }
    
    init(parasites: Binding<[Parasite]>) {
        self._parasites = parasites
    }
    
    var body: some View {
        Section {
            Picker("Parasites", selection: $currentlySelectedParasiteName) {
                ForEach(allParasiteNames, id:\.self) { parasiteName in
                    Text(parasiteName).tag(parasiteName)
                }
            }
            .onChange(of: currentlySelectedParasiteName) {
                parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).0
                parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).1
            }
            
            Text(parasitePositiveEffectDescription)
                .foregroundStyle(.green)
            Text(parasiteNegativeEffectDescription)
                .foregroundStyle(.red)
            
            Section {
                Button("Add Parasite") {
                    withAnimation {
                        addParasite()
                    }
                }
                .disabled(parasites.count == 5)
                
                Button("Remove Selected Parasites") {
                    withAnimation {
                        clearParasites()
                    }
                }
                .disabled(parasites.count < 1)
            }
            
            if parasites.count > 0 {
                Section {
                    ForEach(parasites, id: \.self) { parasite in
                        Text(parasite.name)
                        Text(parasite.positiveDescription)
                            .foregroundStyle(.green)
                        Text(parasite.negativeDescription)
                            .foregroundStyle(.red)
                    }
                } header: {
                    parasites.count > 0 ? Text("Parasites") : Text("")
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            
            // Still getting the weird bug about a random parasite
            // being inserted somehow.
            if isFirstView {
                parasites.removeAll()
                isFirstView = false
            }
            
            allParasiteNames = parasiteNames
            
            currentlySelectedParasiteName = allParasiteNames[0]
            parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).0
            parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).1
        }
    }
    
    private func addParasite() {
        let parasite = Parasite(name: currentlySelectedParasiteName, positiveDescription: parasitePositiveEffectDescription, negativeDescription: parasiteNegativeEffectDescription)
        parasites.append(parasite)
        
        allParasiteNames.removeAll(where: { $0 == parasite.name })
    }
    
    private func clearParasites() {
        parasites.removeAll()
        allParasiteNames = parasiteNames
        currentlySelectedParasiteName = allParasiteNames[0]
    }
    
    private func getParasiteEffectDescriptions(parasiteName: String) -> (String, String) {
        let parasites = Parasite.getAllParasites()
        
        guard let parasite = parasites.first(where: { $0.name == parasiteName }) else { return ("Cannot get positive effect", "Cannot get negative effect") }
        
        return (parasite.positiveDescription, parasite.negativeDescription)
    }
}

#Preview {
    AddParasitesView(parasites: .constant([Parasite]()))
}
