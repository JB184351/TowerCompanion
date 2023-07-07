//
//  AddMalfunctionsView.swift
//  TowerCompanion
//
//  Created by Justin on 7/3/23.
//

import SwiftUI

struct AddMalfunctionsView: View {
    @State private var isPermanent = false
    @State private var malfunctionDescription = ""
    @State private var malfunctionRemovalCondition = ""
    @Binding var malfunctions: [Malfunction]
    
    var body: some View {
        Section {
            Toggle("Is this a permanent Malfunction?", isOn: $isPermanent)
            
            if isPermanent {
                TextField("Enter the Malfunction Description", text: $malfunctionDescription)
            } else {
                TextField("Enter the Malfunction Description", text: $malfunctionDescription)
                TextField("Enter Malfunction Removal Condition", text: $malfunctionRemovalCondition)
            }
            
            
            Button("Add Malfunction") {
                addMalfunction()
            }
            .disabled(malfunctions.count == 7)
            
            Button("Clear All Malfunctions") {
                reset()
            }
            .disabled(malfunctions.count < 1)
        }
        Section {
            ForEach(malfunctions, id: \.self) { malfunction in
                Text(malfunction.malfunctionDescription)
                Text(malfunction.conditionToRemove)
            }
        } header: {
            Text("Malfunctions")
        }
    }
    
    private func addMalfunction() {
        let malfunction = Malfunction(malfunctionDescription: malfunctionDescription, conditionToRemove: malfunctionRemovalCondition)
        malfunctions.append(malfunction)
        
        malfunctionDescription = ""
        malfunctionRemovalCondition = ""
    }
    
    private func reset() {
        malfunctions.removeAll()
    }
    
    
}

#Preview {
    AddMalfunctionsView(malfunctions: .constant([Malfunction]()))
}
