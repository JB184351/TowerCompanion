//
//  CombatDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 9/8/23.
//

import SwiftUI

struct CombatDetailView: View {
    let combat: Combat
    
    var body: some View {
        DisclosureGroup("Combat") {
            Spacer()
            VStack(alignment: .leading) {
                TextHeadline(text: "Weak Point Kills: \(combat.weakPointKills)", color: .returnalLightBlue)
                TextHeadline(text: "Melee Kills: \(combat.weakPointKills)", color: .returnalLightBlue)
                TextHeadline(text: "Hostiles Eliminated: \(combat.weakPointKills)", color: .returnalLightBlue)
                TextHeadline(text: "Malformed Hostiles Eliminated: \(combat.weakPointKills)", color: .returnalLightBlue)
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
//    CombatDetailView()
//}
