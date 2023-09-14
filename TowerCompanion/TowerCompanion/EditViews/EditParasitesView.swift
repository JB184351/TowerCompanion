//
//  EditParasitesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/14/23.
//

import SwiftUI

struct EditParasitesView: View {
    @State private var parasitePositiveEffectDescription = "Positive Effect description will go here"
    @State private var parasiteNegativeEffectDescription = "Negative Effect description will go here"
    @State private var isPlaceHolderEnabled = true
    @State private var currentlySelectedParasiteName = "Amenesic Firestinger"
    @State private var allParasiteNames: [String] = []
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
                isPlaceHolderEnabled = false
                parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).0
                parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: currentlySelectedParasiteName).1
            }
            
            Text(parasitePositiveEffectDescription)
                .foregroundStyle(isPlaceHolderEnabled ? .gray.opacity(0.5) : .green)
            Text(parasiteNegativeEffectDescription)
                .foregroundStyle(isPlaceHolderEnabled ? .gray.opacity(0.5) : .red)
            
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
            if parasites.count > 0 {
                var unselectedParasites = parasiteNames
                
                for parasite in parasites {
                    if unselectedParasites.contains(parasite.name) {
                        unselectedParasites.removeAll { $0 == parasite.name }
                    }
                }
                
                allParasiteNames = unselectedParasites
            } else {
                allParasiteNames = Parasite.getAllParasiteNames()
            }
            
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

//#Preview {
//    EditParasitesView()
//}
