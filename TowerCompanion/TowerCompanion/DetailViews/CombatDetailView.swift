//
//  CombatDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct CombatDetailView: View {
    let combat: Combat

    var body: some View {
        VStack(spacing: 0) {
            postDeathSubHeader("COMBAT")
            postDeathRow("WEAK POINT KILLS", value: "\(combat.weakPointKills)")
            postDeathRow("MELEE KILLS", value: "\(combat.meleeKills)")
            postDeathRow("HOSTILES ELIMINATED", value: "\(combat.hostilesEliminated)")
            postDeathRow("MALFORMED ELIMINATED", value: "\(combat.malformedHostilesEliminated)")
        }
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}

// MARK: - Shared post-death helpers

func postDeathSubHeader(_ title: String) -> some View {
    Text(title)
        .font(.system(size: 9, weight: .bold, design: .monospaced))
        .foregroundStyle(Color.returnalYellow.opacity(0.7))
        .kerning(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
        .padding(.top, 10)
        .padding(.bottom, 4)
        .background(Color.returnalYellow.opacity(0.05))
}

func postDeathRow(_ label: String, value: String) -> some View {
    HStack {
        Text(label)
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundStyle(Color.returnalLightBlue.opacity(0.6))
            .kerning(1)
        Spacer()
        Text(value)
            .font(.system(size: 14, weight: .heavy, design: .monospaced))
            .foregroundStyle(Color.returnalLightBlue)
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 9)
    .background(Color.white.opacity(0.02))
    .overlay(
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color.returnalLightBlue.opacity(0.08)),
        alignment: .bottom
    )
}
