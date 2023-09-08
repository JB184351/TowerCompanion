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
    @Binding var objectiveValues: Objectives?
    
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
                TextField("Enter Number Here", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: pyliodsEliminated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter Number of Algos that you defeated")
                TextField("Enter Number Here", value: $algosDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosDefeated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter Number of Algos final forms that you defeated")
                TextField("Enter Number Here", value: $algosFinalFormDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosFinalFormDefeated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter Number of Algos infinity forms that you defeated")
                TextField("Enter Number Here", value: $algosInfinityFormDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosInfinityFormDefeated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
            }
            .navigationTitle("Objective Values")
        }
    }
    
}

#Preview {
    AddObjectivesValueView(objectiveValues: .constant(Objectives(pylioidsEliminated: 0, algosDefeated: 0, algosFinalFormDefeated: 0, algosInfinityFormDefeated: 0)))
}
