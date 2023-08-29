//
//  AddObjectivesValueView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddObjectivesValueView: View {
    @State private var pyliodsEliminated = 0
    @State private var algosDefeated = 0
    @State private var algosFinalFormDefeated = 0
    @State private var algosInfinityFormDefeated = 0
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
                Text("Enter Enter Number of Pyliods that were Eliminated")
                TextField("", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter Number of Algos that you defeated")
                TextField("", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter Number of Algos final forms that you defeated")
                TextField("", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter Number of Algos infinity forms that you defeated")
                TextField("", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
            }
            .navigationTitle("Objective Values")
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
    AddObjectivesValueView()
}
