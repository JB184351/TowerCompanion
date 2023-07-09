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
    @State private var isFirstView = false
    @Binding var malfunctions: [Malfunction]
    
    var body: some View {
        Section {
            Toggle("Is this a permanent Malfunction?", isOn: $isPermanent)

            TextField("Enter the Malfunction Description", text: $malfunctionDescription)
            TextField("Enter Malfunction Removal Condition", text: $malfunctionRemovalCondition)
                .isHidden(isPermanent)
            
            Button("Add Malfunction") {
                addMalfunction()
            }
            .disabled(malfunctions.count == 7 || malfunctionDescription.isEmpty)
            
            Button("Clear All Malfunctions") {
                reset()
            }
            .disabled(malfunctions.count < 1)
        }
        // Some reason the malfunctions array gets 1 item
        // inserted so I'm removing it forcibly until I
        // can figure out why that is
        .onAppear {
            if !isFirstView {
                malfunctions.removeAll()
                isFirstView = true
            }
        }
        
        Section {
            ForEach(malfunctions, id: \.self) { malfunction in
                Text(malfunction.malfunctionDescription)
                Text(malfunction.conditionToRemove)
            }
        }
        .isHidden(malfunctions.count == 0)
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

//#Preview {
//    AddMalfunctionsView(malfunctions: .constant([Malfunction]()))
//}
