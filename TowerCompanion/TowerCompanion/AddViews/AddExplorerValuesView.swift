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
    @Binding var explorerValues: Explorer?
    
    @FocusState private var textFieldFocus: Bool
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    var body: some View {
        Text("Enter Number of Floors cleared")
        TextField("Enter the Number Here", value: $floorsCleared, formatter: numberFormatter)
            .keyboardType(.numberPad)
            .focused($textFieldFocus)
            .onAppear {
                explorerValues = Explorer(floorsCleared: 0, silphiumFound: 0, obolitesCollected: 0, calibratorsCollected: 0)
            }
            .onChange(of: floorsCleared) { oldValue, newValue in
                explorerValues = Explorer(floorsCleared: floorsCleared, silphiumFound: silphiumFound, obolitesCollected: obolitesCollected, calibratorsCollected: calibratorsCollected)
            }
        
        Text("Enter Number of Silphiums found")
        TextField("Enter the Number Here", value: $silphiumFound, formatter: numberFormatter)
            .keyboardType(.numberPad)
            .focused($textFieldFocus)
            .onChange(of: silphiumFound) { oldValue, newValue in
                explorerValues = Explorer(floorsCleared: floorsCleared, silphiumFound: silphiumFound, obolitesCollected: obolitesCollected, calibratorsCollected: calibratorsCollected)
            }
        
        Text("Enter the number of Obolites collected")
        TextField("Enter the Number Here", value: $obolitesCollected, formatter: numberFormatter)
            .keyboardType(.numberPad)
            .focused($textFieldFocus)
            .onChange(of: obolitesCollected) { oldValue, newValue in
                explorerValues = Explorer(floorsCleared: floorsCleared, silphiumFound: silphiumFound, obolitesCollected: obolitesCollected, calibratorsCollected: calibratorsCollected)
            }
        
        Text("Enter the Number of Calibrators collected")
        TextField("Enter the Number Here", value: $calibratorsCollected, formatter: numberFormatter)
            .keyboardType(.numberPad)
            .focused($textFieldFocus)
            .onChange(of: calibratorsCollected) { oldValue, newValue in
                explorerValues = Explorer(floorsCleared: floorsCleared, silphiumFound: silphiumFound, obolitesCollected: obolitesCollected, calibratorsCollected: calibratorsCollected)
            }
    }
}

#Preview {
    AddExplorerValuesView(explorerValues: .constant(Explorer(floorsCleared: 0, silphiumFound: 0, obolitesCollected: 0, calibratorsCollected: 0)))
}
