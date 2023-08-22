//
//  AddParasitesView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/23.
//

import SwiftUI

struct AddParasitesView: View {
    @State private var parasiteName = ""
    @State private var parasitePositiveEffectDescription = "Positive Effect description will go here"
    @State private var parasiteNegativeEffectDescription = "Negative Effect description will go here"
    @State private var numberOfParasites = 1
    @State private var isPlaceHolderEnabled = true
    @State private var parasiteNamesUsedInRun = [String]()
    @State private var pickerCount = 1
    @State private var nonComputedParasiteNames = [String]()
    @State private var isFirstView = false
    @Binding var parasites: [Parasite]
    
    private var parasiteNames: [String] {
        return Parasite.getAllParasiteNames()
    }
    
    init(parasites: Binding<[Parasite]>) {
        _parasiteNamesUsedInRun = State(initialValue: Array(repeating: "", count: 1))
        _nonComputedParasiteNames = State(initialValue: Array(repeating: "", count: 1))
        self._parasites = parasites
    }
    
    var body: some View {
        ForEach(0..<1, id: \.self) { index in
            Picker("Parasites", selection: Binding(
                get: { nonComputedParasiteNames[index] },
                set: { nonComputedParasiteNames[index] = $0 }
            )) {
                ForEach(nonComputedParasiteNames, id:\.self) { parasiteName in
                    Text(parasiteName).tag(parasiteName)
                }
            }
            // Some reason the parasites array gets 1 item
            // inserted so I'm removing it forcibly until I
            // can figure out why that is
            .onAppear {
                if !isFirstView {
                    parasites.removeAll()
                    nonComputedParasiteNames = parasiteNames
                    isFirstView = true
                }
            }
            .onChange(of: nonComputedParasiteNames[index]) {
                isPlaceHolderEnabled = false
                parasitePositiveEffectDescription = getParasiteEffectDescriptions(parasiteName: nonComputedParasiteNames[index]).0
                parasiteNegativeEffectDescription = getParasiteEffectDescriptions(parasiteName: nonComputedParasiteNames[index]).1
            }
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
                Text("Parasites")
            }
        } else {
            EmptyView()
        }
    }
    
    private func addPicker() {
        if !parasitePositiveEffectDescription.isEmpty {
            pickerCount += 1
        } else {
            // MARK: - TODO Add Alert Message Here
            print("We should present an alert here")
        }
    }
    
    private func addParasite() {
        for (index, _) in parasiteNamesUsedInRun.enumerated() {
            let parasite = Parasite(name: nonComputedParasiteNames[index], positiveDescription: parasitePositiveEffectDescription, negativeDescription: parasiteNegativeEffectDescription)
            parasites.append(parasite)
            
            nonComputedParasiteNames.remove(at: index)
        }
    }
    
    private func clearParasites() {
        parasites.removeAll()
        nonComputedParasiteNames = parasiteNames
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
