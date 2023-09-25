//
//  AddSkillValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddSkillValuesView: View {
    @State private var perfectFloors = 0
    @State private var consecutivePerfectFloors = 0
    @State private var peakAdrenaline = 0.0
    @State private var midairMelee = 0
    @Binding var skillValues: Skill?
    
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
                Text("Enter the number of Perfect Floors")
                TextField("Enter value here", value: $perfectFloors, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: perfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
                
                Text("Enter the number of consectuive Perfect Floors")
                TextField("Enter value here", value: $consecutivePerfectFloors, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: consecutivePerfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
                
                Text("Enter the Peak Adrenaline value")
                TextField("Enter Value Here", value: $peakAdrenaline, formatter: numberFormatter)
                    .keyboardType(.decimalPad)
                    .focused($textFieldFocus)
                    .onChange(of: peakAdrenaline) { oldValue, newValue in
                        if peakAdrenaline > 5.0 {
                            peakAdrenaline = 5.0
                        } else if peakAdrenaline < 0.0 {
                            peakAdrenaline = 0.0
                        }
                        
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
                
                Text("Enter the number of Mid-Air Melee kills")
                TextField("Enter Number Here", value: $midairMelee, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: midairMelee) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
            }
            .navigationTitle("Skill Values")
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
    AddSkillValuesView(skillValues: .constant(Skill(perfectFloors: 0, consecutivePerfectFloors: 0, peakAdrenaline: 0, midairMelee: 0)))
}
