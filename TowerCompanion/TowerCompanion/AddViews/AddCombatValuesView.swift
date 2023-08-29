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
                TextField("Enter Number of Weak Point Kills", value: $weakPointKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                TextField("Enter Number of Melee Kills", value: $meleeKills, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                TextField("Enter the number of Hostiles eliminated", value: $hostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                TextField("Enter the Number of Malformed Hostiles Eliminated", value: $malformedHostilesEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
            }
            .navigationTitle("Combat Values")
        }
    }
}

#Preview {
    AddCombatValuesView()
}
