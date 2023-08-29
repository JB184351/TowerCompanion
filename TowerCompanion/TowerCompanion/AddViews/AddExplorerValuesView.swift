//
//  AddExplorerValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddExplorerValuesView: View {
    @State private var floorsCleared = 0
    @State private var silphiumFound = 0
    @State private var obolitesCollected = 0
    @State private var calibratorsCollected = 0
    
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
                Text("Enter Number of Floors cleared")
                TextField("Enter the Number Here", value: $floorsCleared, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
               
                Text("Enter Number of Silphiums found")
                TextField("Enter the Number Here", value: $silphiumFound, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter the number of Obolites collected")
                TextField("Enter the Number Here", value: $obolitesCollected, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                
                Text("Enter the Number of Calibrators collected")
                TextField("Enter the Number Here", value: $calibratorsCollected, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
            }
            .navigationTitle("Explorer Values")
        }
    }
}

#Preview {
    AddExplorerValuesView()
}
