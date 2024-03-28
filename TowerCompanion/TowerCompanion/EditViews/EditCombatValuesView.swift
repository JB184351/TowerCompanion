//
//  EditCombatValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/15/23.
//

import SwiftUI

struct EditCombatValuesView: View {
    @State private var weakPointKills = "0"
    @State private var meleeKills = "0"
    @State private var hostilesEliminated = "0"
    @State private var malformedHostilesEliminated = "0"
    @Binding var combatValues: Combat?
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Enter the number of Weak Point kills")
                TextField("Enter value here", text: $weakPointKills)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($weakPointKills)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: weakPointKills) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: Int(weakPointKills) ?? 0, meleeKills: Int(meleeKills) ?? 0, hostilesEliminated: Int(hostilesEliminated) ?? 0, malformedHostilesEliminated: Int(malformedHostilesEliminated) ?? 0)
                    }
                
                Text("Enter the number of Melee kills")
                TextField("Enter value here", text: $meleeKills)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($meleeKills)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: meleeKills) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: Int(weakPointKills) ?? 0, meleeKills: Int(meleeKills) ?? 0, hostilesEliminated: Int(hostilesEliminated) ?? 0, malformedHostilesEliminated: Int(malformedHostilesEliminated) ?? 0)
                    }
                
                Text("Enter the number of Hostiles eliminated")
                TextField("Enter value here", text: $hostilesEliminated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($hostilesEliminated)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: hostilesEliminated) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: Int(weakPointKills) ?? 0, meleeKills: Int(meleeKills) ?? 0, hostilesEliminated: Int(hostilesEliminated) ?? 0, malformedHostilesEliminated: Int(malformedHostilesEliminated) ?? 0)
                    }
                
                Text("Enter the number of Malformed Hostiles eliminated")
                TextField("Enter value here", text: $malformedHostilesEliminated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($malformedHostilesEliminated)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: malformedHostilesEliminated) { oldValue, newValue in
                        combatValues = Combat(weakPointKills: Int(weakPointKills) ?? 0, meleeKills: Int(meleeKills) ?? 0, hostilesEliminated: Int(hostilesEliminated) ?? 0, malformedHostilesEliminated: Int(malformedHostilesEliminated) ?? 0)
                    }
            }
            .onAppear {
                if let combatValues = combatValues {
                    weakPointKills = String(combatValues.weakPointKills)
                    meleeKills = String(combatValues.meleeKills)
                    hostilesEliminated = String(combatValues.hostilesEliminated)
                    malformedHostilesEliminated = String(combatValues.malformedHostilesEliminated)
                }
            }
            .navigationTitle("Combat Values")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = nil
                    }
                }
            }
            .onDisappear {
                combatValues = Combat(weakPointKills: Int(weakPointKills) ?? 0, meleeKills: Int(meleeKills) ?? 0, hostilesEliminated: Int(hostilesEliminated) ?? 0, malformedHostilesEliminated: Int(malformedHostilesEliminated) ?? 0)
            }
        }
    }
}

//#Preview {
//    EditCombatValuesView()
//}
