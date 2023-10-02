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
            .navigationTitle("Combat Values")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    AddCombatValuesView(combatValues: .constant(Combat(weakPointKills: 0, meleeKills: 0, hostilesEliminated: 0, malformedHostilesEliminated: 0)))
}
