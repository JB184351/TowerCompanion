//
//  StatsDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct StatsDetailView: View {
    let stats: Stats
    
    var body: some View {
        DisclosureGroup("Stats") {
            Spacer()
            VStack(alignment: .leading) {
                HeavyTextHeadline(text: "Weapon Damage: \(stats.weaponDamage)%", color: .returnalLightBlue)
                HeavyTextHeadline(text: "Protection: \(stats.protection)%", color: .returnalLightBlue)
                HeavyTextHeadline(text: "Proficiency Rate: \(stats.proficiencyRate)%", color: .returnalLightBlue)
                HeavyTextHeadline(text: "Repair Efficiency: \(stats.repairEfficiency)%", color: .returnalLightBlue)
                HeavyTextHeadline(text: "Alt-Fire Cooldown: \(stats.altFireCoolDown) seconds", color: .returnalLightBlue)
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
//    StatsDetailView()
//}
