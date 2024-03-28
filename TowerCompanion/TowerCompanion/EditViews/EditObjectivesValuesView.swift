//
//  EditObjectivesValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI

struct EditObjectivesValuesView: View {
    @State private var pyliodsEliminated = "0"
    @State private var algosDefeated = "0"
    @State private var algosFinalFormDefeated = "0"
    @State private var algosInfinityFormDefeated = "0"
    @Binding var objectiveValues: Objectives?
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Enter the number of Pyliods eliminated")
                TextField("Enter value here", text: $pyliodsEliminated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($pyliodsEliminated)
                    .onChange(of: pyliodsEliminated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: Int(pyliodsEliminated) ?? 0, algosDefeated: Int(algosDefeated) ?? 0, algosFinalFormDefeated: Int(algosFinalFormDefeated) ?? 0, algosInfinityFormDefeated: Int(algosInfinityFormDefeated) ?? 0)
                    }
                
                Text("Enter the number of Algos eliminated")
                TextField("Enter value here", text: $algosDefeated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($algosDefeated)
                    .onChange(of: algosDefeated) { oldValue, newValue in
                        if Int(algosDefeated) ?? 0 >= 2 {
                            algosDefeated = "2"
                        } else if Int(algosDefeated) ?? 0 < 0 {
                            algosDefeated = "0"
                        }
                        
                        objectiveValues = Objectives(pylioidsEliminated: Int(pyliodsEliminated) ?? 0, algosDefeated: Int(algosDefeated) ?? 0, algosFinalFormDefeated: Int(algosFinalFormDefeated) ?? 0, algosInfinityFormDefeated: Int(algosInfinityFormDefeated) ?? 0)
                    }
                
                Text("Enter the number of Algos final forms eliminated")
                TextField("Enter value here", text: $algosFinalFormDefeated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($algosFinalFormDefeated)
                    .onChange(of: algosFinalFormDefeated) { oldValue, newValue in
                        if Int(algosFinalFormDefeated) ?? 0 >= 1 {
                            algosFinalFormDefeated = "1"
                        } else {
                            algosFinalFormDefeated = "0"
                        }
                        
                        objectiveValues = Objectives(pylioidsEliminated: Int(pyliodsEliminated) ?? 0, algosDefeated: Int(algosDefeated) ?? 0, algosFinalFormDefeated: Int(algosFinalFormDefeated) ?? 0, algosInfinityFormDefeated: Int(algosInfinityFormDefeated) ?? 0)
                    }
                
                Text("Enter the number of Algos infinity forms eliminated")
                TextField("Enter value here", text: $algosInfinityFormDefeated)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($algosFinalFormDefeated)
                    .onChange(of: algosInfinityFormDefeated) { oldValue, newValue in
                        objectiveValues = Objectives(pylioidsEliminated: Int(pyliodsEliminated) ?? 0, algosDefeated: Int(algosDefeated) ?? 0, algosFinalFormDefeated: Int(algosFinalFormDefeated) ?? 0, algosInfinityFormDefeated: Int(algosInfinityFormDefeated) ?? 0)
                    }
            }
            .onAppear {
                if let objectiveValues = objectiveValues {
                    pyliodsEliminated = String(objectiveValues.pylioidsEliminated)
                    algosDefeated = String(objectiveValues.algosDefeated)
                    algosFinalFormDefeated = String(objectiveValues.algosFinalFormDefeated)
                    algosInfinityFormDefeated = String(objectiveValues.algosInfinityFormDefeated)
                }
            }
            .navigationTitle("Objective Values")
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
                objectiveValues = Objectives(pylioidsEliminated: Int(pyliodsEliminated) ?? 0, algosDefeated: Int(algosDefeated) ?? 0, algosFinalFormDefeated: Int(algosFinalFormDefeated) ?? 0, algosInfinityFormDefeated: Int(algosInfinityFormDefeated) ?? 0)
            }
        }
    }
}

//#Preview {
//    EditObjectivesValuesView()
//}
