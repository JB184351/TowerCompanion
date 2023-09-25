//
//  EditObjectivesValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI

struct EditObjectivesValuesView: View {
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
                Text("Enter the number of Pyliods eliminated")
                TextField("Enter value here", value: $pyliodsEliminated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: pyliodsEliminated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter the number of Algos eliminated")
                TextField("Enter value here", value: $algosDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosDefeated) { oldValue, newValue in
                        if algosDefeated >= 2 {
                            algosDefeated = 2
                        } else if algosDefeated < 0 {
                            algosDefeated = 0
                        }
                        
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter the number of Algos final forms eliminated")
                TextField("Enter value here", value: $algosFinalFormDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosFinalFormDefeated) { oldValue, newValue in
                        if algosFinalFormDefeated >= 1 {
                            algosFinalFormDefeated = 1
                        } else {
                            algosFinalFormDefeated = 0
                        }
                        
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
                
                Text("Enter the number of Algos infinity forms eliminated")
                TextField("Enter value here", value: $algosInfinityFormDefeated, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: algosInfinityFormDefeated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
                    }
            }
            .onAppear {
                if let objectiveValues = objectiveValues {
                    pyliodsEliminated = objectiveValues.pylioidsEliminated
                    algosDefeated = objectiveValues.algosDefeated
                    algosFinalFormDefeated = objectiveValues.algosFinalFormDefeated
                    algosInfinityFormDefeated = objectiveValues.algosInfinityFormDefeated
                }
            }
            .navigationTitle("Objective Values")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = false
                    }
                }
            }
            .onDisappear {
                objectiveValues = Objectives(pylioidsEliminated: pyliodsEliminated, algosDefeated: algosDefeated, algosFinalFormDefeated: algosFinalFormDefeated, algosInfinityFormDefeated: algosInfinityFormDefeated)
            }
        }
    }
}

//#Preview {
//    EditObjectivesValuesView()
//}
