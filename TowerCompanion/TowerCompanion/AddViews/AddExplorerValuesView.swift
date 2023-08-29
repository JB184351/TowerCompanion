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
                TextField("Enter Number of Floors cleared", value: $floorsCleared, formatter: numberFormatter)
                TextField("Enter Number of Silphiums found", value: $silphiumFound, formatter: numberFormatter)
                TextField("Enter the number of Obolites collected", value: $obolitesCollected, formatter: numberFormatter)
                TextField("Enter the Number of Calibrators collected", value: $calibratorsCollected, formatter: numberFormatter)
            }
            .navigationTitle("Explorer Values")
        }
    }
}

#Preview {
    AddExplorerValuesView()
}
