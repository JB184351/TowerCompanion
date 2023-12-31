//
//  EditCombatValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/15/23.
//

import SwiftUI

struct EditCombatValuesView: View {
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
        
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Enter the number of Weak Point kills")
                TextField("Enter value here", value: $weakPointKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: weakPointKills) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                    }
                
                Text("Enter the number of Melee kills")
                TextField("Enter value here", value: $meleeKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: meleeKills) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: weakPointKills, meleeKills: newValue, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                    }
                
                Text("Enter the number of Hostiles eliminated")
                TextField("Enter value here", value: $hostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: hostilesEliminated) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                    }
                
                Text("Enter the number of Malformed Hostiles eliminated")
                TextField("Enter value here", value: $malformedHostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: malformedHostilesEliminated) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
                    }
            }
            .onAppear {
                if let combatValues = combatValues {
                    weakPointKills = combatValues.weakPointKills
                    meleeKills = combatValues.meleeKills
                    hostilesEliminated = combatValues.hostilesEliminated
                    malformedHostilesEliminated = combatValues.malformedHostilesEliminated
                }
            }
            .navigationTitle("Combat Values")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = false
                    }
                }
            }
            .onDisappear {
                combatValues = Combat(weakPointKills: weakPointKills, meleeKills: meleeKills, hostilesEliminated: hostilesEliminated, malformedHostilesEliminated: malformedHostilesEliminated)
            }
        }
    }
}

//#Preview {
//    EditCombatValuesView()
//}
