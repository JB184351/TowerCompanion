//
//  EditSkillValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 9/18/23.
//

import SwiftUI

struct EditSkillValuesView: View {
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
                Text("Enter Number of Perfect Floors Here")
                TextField("Enter Number Here", value: $perfectFloors, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: perfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
                
                Text("Add Number of consectuive Perfect floors")
                TextField("Enter Number Here", value: $consecutivePerfectFloors, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: consecutivePerfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
                
                Text("Enter Peak Adrenaline Value Here")
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
                
                Text("Add Number of Mid-Air Melee kills.")
                TextField("Enter Number Here", value: $midairMelee, formatter: numberFormatter)
                    .keyboardType(.numberPad)
                    .focused($textFieldFocus)
                    .onChange(of: midairMelee) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee)
                    }
            }
            .onAppear {
                if let skillValues = skillValues {
                    perfectFloors = skillValues.perfectFloors
                    consecutivePerfectFloors = skillValues.consecutivePerfectFloors
                    peakAdrenaline = skillValues.peakAdrenaline
                    midairMelee = skillValues.midairMelee
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
            .onDisappear {
                skillValues = Skill(perfectFloors: perfectFloors, consecutivePerfectFloors: consecutivePerfectFloors, peakAdrenaline: peakAdrenaline, midairMelee: midairMelee )
            }
        }
    }
}

//#Preview {
//    EditSkillValuesView()
//}
