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
    @State private var peakAdrenaline = 0
    @State private var midairMelee = 0
    
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
                TextField("Add Number of perfect floors", value: $perfectFloors, formatter: numberFormatter)
                TextField("Add Number of consectuive Perfect floors", value: $consecutivePerfectFloors, formatter: numberFormatter)
                TextField("Peak Adrenaline", value: $peakAdrenaline, formatter: numberFormatter)
                TextField("Add Number of Mid-Air Melee kills.", value: $midairMelee, formatter: numberFormatter)
            }
            .navigationTitle("Skill Values")
        }
    }
}

#Preview {
    AddSkillValuesView()
}
