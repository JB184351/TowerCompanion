//
//  AddExplorerValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddExplorerValuesView: View {
    @State private var floorsCleared = "0"
    @State private var silphiumFound = "0"
    @State private var obolitesCollected = "0"
    @State private var calibratorsCollected = "0"
    @Binding var explorerValues: Explorer?
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Enter the number of Floors cleared")
                TextField("Enter value here", text: $floorsCleared)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($floorsCleared)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onAppear {
                        explorerValues = Explorer(floorsCleared: 0, silphiumFound: 0, obolitesCollected: 0, calibratorsCollected: 0)
                    }
                    .onChange(of: floorsCleared) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
                
                Text("Enter the number of Silphiums found")
                TextField("Enter value here", text: $silphiumFound)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($silphiumFound)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: silphiumFound) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
                
                Text("Enter the number of Obolites collected")
                TextField("Enter value here", text: $obolitesCollected)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($obolitesCollected)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: obolitesCollected) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
                
                Text("Enter the number of Calibrators collected")
                TextField("Enter value here", text: $calibratorsCollected)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($calibratorsCollected)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: calibratorsCollected) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
            }
            .navigationTitle("Explorer Values")
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
        }
    }
}

#Preview {
    AddExplorerValuesView(explorerValues: .constant(Explorer(floorsCleared: 0, silphiumFound: 0, obolitesCollected: 0, calibratorsCollected: 0)))
}
