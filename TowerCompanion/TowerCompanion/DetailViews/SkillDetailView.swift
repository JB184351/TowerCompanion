//
//  SkillDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 9/8/23.
//

import SwiftUI

struct SkillDetailView: View {
    let skill: Skill
    
    var body: some View {
        DisclosureGroup("Skill") {
            Spacer()
            VStack(alignment: .leading) {
                TextHeadline(text: "Perfect Floors: \(skill.perfectFloors)", color: .returnalLightBlue)
                TextHeadline(text: "Consecutive Perfect Floors: \(skill.consecutivePerfectFloors)", color: .returnalLightBlue)
                TextHeadline(text: "Peak Adrenaline: \(skill.peakAdrenaline)", color: .returnalLightBlue)
                TextHeadline(text: "Mid-air Melee: \(skill.midairMelee)", color: .returnalLightBlue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalLightBlue)
    }
}

//#Preview {
//    SkillDetailView()
//}
