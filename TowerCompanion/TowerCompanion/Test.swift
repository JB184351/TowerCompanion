//
//  Test.swift
//  TowerCompanion
//
//  Created by Justin on 6/26/23.
//

import SwiftUI

struct Test: View {
    @State private var array: [String] = []
    @State private var selectedIndex: Int = 0
    @State private var inputValue: String = ""
    let hardLimit = 5
    
    var body: some View {
        VStack {
            Picker("Select an item", selection: $selectedIndex) {
                ForEach(0..<array.count, id: \.self) { index in
                    Text(array[index])
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Enter a value", text: $inputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                updateArray()
            }) {
                Text("Add to Array")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
        }
        .padding()
    }
    
    private func updateArray() {
        guard !inputValue.isEmpty else { return }
        
        if array.count < hardLimit {
            array.append(inputValue)
        }
        
        print(array)
        
        inputValue = ""
    }
}

#Preview {
    Test()
}
