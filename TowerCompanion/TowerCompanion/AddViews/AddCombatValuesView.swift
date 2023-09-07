//
//  AddCombatValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddCombatValuesView: View {
    @State private var weakPointKills = 0
    @State private var meleeKills = 0
    @State private var hostilesEliminated = 0
    @State private var malformedHostilesEliminated = 0
    @Binding var combatValues: Combat?
    
    @FocusState private var textFieldFocus: Bool
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Text("Enter Number of Weak Point Kills")
                TextField("Enter the Number Here", value: $weakPointKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter Number of Melee Kills")
                TextField("Enter the Number Here", value: $meleeKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter the number of Hostiles eliminated")
                TextField("Enter the Number Here", value: $hostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter the Number of Malformed Hostiles Eliminated")
                TextField("Enter the Number Here", value: $malformedHostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Section {
                    NavigationLink(destination: AddExplorerValuesView()) {
                        Text("Submit")
                    }
                    .disabled(shouldDisableButton())
                    .onTapGesture {
                        combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                    }
                }
            }
            .navigationTitle("Combat Values")
            .onAppear {
                combatValues = nil
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddExplorerValuesView()) {
                        Text(combatValues == nil ? "Skip" : "Next")
                    }
                    .onTapGesture {
                        if !shouldDisableButton() {
                            combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                        } else {
                            combatValues = nil
                        }
                    }
                }
            }
        }
    }
    
    private func shouldDisableButton() -> Bool {
        return !(weakPointKills > 0 || meleeKills > 0 || hostilesEliminated > 0 || malformedHostilesEliminated > 0)
    }
}

#Preview {
    AddCombatValuesView(combatValues: .constant(Combat(weakPointKills: 0, meleeKills: 0, hostilesEliminated: 0, malformedHostilesEliminated: 0)))
}
