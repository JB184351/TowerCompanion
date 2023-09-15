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
                TextHeadline(text: "Melee Kills: \(combat.meleeKills)", color: .returnalLightBlue)
                TextHeadline(text: "Hostiles Eliminated: \(combat.hostilesEliminated)", color: .returnalLightBlue)
                TextHeadline(text: "Malformed Hostiles Eliminated: \(combat.malformedHostilesEliminated)", color: .returnalLightBlue)
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
