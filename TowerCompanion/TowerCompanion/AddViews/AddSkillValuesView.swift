//
//  AddSkillValuesView.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import SwiftUI

struct AddSkillValuesView: View {
    @State private var perfectFloors = "0"
    @State private var consecutivePerfectFloors = "0"
    @State private var peakAdrenaline = "0.0"
    @State private var midairMelee = "0"
    @Binding var skillValues: Skill?
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Enter the number of Perfect Floors")
                TextField("Enter value here", text: $perfectFloors)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($perfectFloors)
                    .onChange(of: perfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: Int(perfectFloors) ?? 0, consecutivePerfectFloors: Int(consecutivePerfectFloors) ?? 0, peakAdrenaline: Double(peakAdrenaline) ?? 0, midairMelee: Int(midairMelee) ?? 0)
                    }
                
                Text("Enter the number of consectuive Perfect Floors")
                TextField("Enter value here", text: $consecutivePerfectFloors)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($consecutivePerfectFloors)
                    .onChange(of: consecutivePerfectFloors) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: Int(perfectFloors) ?? 0, consecutivePerfectFloors: Int(consecutivePerfectFloors) ?? 0, peakAdrenaline: Double(peakAdrenaline) ?? 0, midairMelee: Int(midairMelee) ?? 0)
                    }
                
                Text("Enter the Peak Adrenaline value")
                TextField("Enter value here", text: $peakAdrenaline)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($peakAdrenaline, includeDecimal: true)
                    .onChange(of: peakAdrenaline) { oldValue, newValue in
                        if Double(peakAdrenaline) ?? 0 > 5.0 {
                            peakAdrenaline = "5.0"
                        } else if Double(peakAdrenaline) ?? 0 < 0.0 {
                            peakAdrenaline = "0.0"
                        }
                        
                        skillValues = Skill(perfectFloors: Int(perfectFloors) ?? 0, consecutivePerfectFloors: Int(consecutivePerfectFloors) ?? 0, peakAdrenaline: Double(peakAdrenaline) ?? 0, midairMelee: Int(midairMelee) ?? 0)
                    }
                
                Text("Enter the number of Mid-Air Melee kills")
                TextField("Enter value here", text: $midairMelee)
                    .focused($textFieldFocus, equals: .int)
                    .numbersOnly($midairMelee)
                    .onChange(of: midairMelee) { oldValue, newValue in
                        skillValues = Skill(perfectFloors: Int(perfectFloors) ?? 0, consecutivePerfectFloors: Int(consecutivePerfectFloors) ?? 0, peakAdrenaline: Double(peakAdrenaline) ?? 0, midairMelee: Int(midairMelee) ?? 0)
                    }
            }
            .navigationTitle("Skill Values")
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
    AddSkillValuesView(skillValues: .constant(Skill(perfectFloors: 0, consecutivePerfectFloors: 0, peakAdrenaline: 0, midairMelee: 0)))
}
