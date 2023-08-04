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
            VStack {
                HeavyTextHeadline(text: "\(stats.weaponDamage)%", color: .returnalYellow)
                HeavyTextHeadline(text: "\(stats.protection)%", color: .returnalYellow)
                HeavyTextHeadline(text: "\(stats.profiencyRate)%", color: .returnalYellow)
                HeavyTextHeadline(text: "\(stats.repairEffiency)%", color: .returnalYellow)
                HeavyTextHeadline(text: "\(stats.altFireCoolDown)%", color: .returnalYellow)
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
