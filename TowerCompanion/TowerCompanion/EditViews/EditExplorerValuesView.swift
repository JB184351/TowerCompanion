//
//  EditExplorerValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/15/23.
//

import SwiftUI

struct EditExplorerValuesView: View {
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
                    .onChange(of: floorsCleared) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
                
                Text("Enter the number of Obolites collected")
                TextField("Enter value here", text: $obolitesCollected)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($obolitesCollected)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: floorsCleared) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
                
                Text("Enter the number of Calibrators collected")
                TextField("Enter value here", text: $calibratorsCollected)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($calibratorsCollected)
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .onChange(of: floorsCleared) { oldValue, newValue in
                        explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
                    }
            }
            .onAppear {
                if let explorerValues = explorerValues {
                    floorsCleared = String(explorerValues.floorsCleared)
                    silphiumFound = String(explorerValues.silphiumFound)
                    obolitesCollected = String(explorerValues.obolitesCollected)
                    calibratorsCollected = String(explorerValues.calibratorsCollected)
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
            .onDisappear {
                explorerValues = Explorer(floorsCleared: Int(floorsCleared) ?? 0, silphiumFound: Int(silphiumFound) ?? 0, obolitesCollected: Int(obolitesCollected) ?? 0, calibratorsCollected: Int(calibratorsCollected) ?? 0)
            }
        }
    }
}

//#Preview {
//    EditExplorerValuesView()
//}
