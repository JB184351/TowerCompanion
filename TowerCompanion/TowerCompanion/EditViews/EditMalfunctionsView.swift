//
//  EditMalfunctionsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/14/23.
//

import SwiftUI

struct EditMalfunctionsView: View {
    @State private var isPermanent = false
    @State private var malfunctionDescription = ""
    @State private var malfunctionRemovalCondition = ""
    @State private var isFirstView = false
    @Binding var malfunctions: [Malfunction]
    
    var body: some View {
        Section {
            Toggle("Is this a permanent Malfunction?", isOn: $isPermanent)
            
            TextField("Enter the Malfunction Description", text: $malfunctionDescription)
            
            if !isPermanent {
                TextField("Enter Malfunction Removal Condition", text: $malfunctionRemovalCondition)
            }
            
            Button("Add Malfunction") {
                withAnimation() {
                    addMalfunction()
                }
            }
            .disabled(malfunctions.count == 7 || malfunctionDescription.isEmpty)
            
            Button("Clear All Malfunctions") {
                withAnimation {
                    reset()
                }
            }
            .disabled(malfunctions.count < 1)
            
            Section {
                ForEach(malfunctions, id: \.self) { malfunction in
                    Text(malfunction.malfunctionType == .normal ? "Malfucntion: \(malfunction.malfunctionDescription) \nCondition To Remove: \(malfunction.conditionToRemove)" : malfunction.malfunctionDescription)
                        .multilineTextAlignment(.leading)
                }
                .onDelete(perform: { indexSet in
                    malfunctions.remove(atOffsets: indexSet)
                })
            }
            .onChange(of: isPermanent) { oldValue, newValue in
                malfunctionRemovalCondition = ""
            }
        }
    }
    
    private func addMalfunction() {
        let malfunctionType: MalfunctionType = isPermanent ? .permanent : .normal
        
        let malfunction = Malfunction(malfunctionDescription: malfunctionDescription, conditionToRemove: malfunctionRemovalCondition, malfunctionType: malfunctionType)
        malfunctions.append(malfunction)
        
        malfunctionDescription = ""
        malfunctionRemovalCondition = ""
    }
    
    private func reset() {
        malfunctions.removeAll()
    }
}

//#Preview {
//    EditMalfunctionsView(malfunctions: .con)
//}
