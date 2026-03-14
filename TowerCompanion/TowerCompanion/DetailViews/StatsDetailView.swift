//
//  StatsDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct StatsDetailView: View {
    let stats: Stats

    var body: some View {
        VStack(spacing: 0) {
            statRow("WEAPON DAMAGE", value: "\(stats.weaponDamage.formatted())%")
            statRow("PROTECTION", value: "\(stats.protection.formatted())%")
            statRow("PROFICIENCY RATE", value: "\(stats.proficiencyRate.formatted())%")
            statRow("REPAIR EFFICIENCY", value: "\(stats.repairEfficiency.formatted())%")
            statRow("ALT-FIRE COOLDOWN", value: "\(stats.altFireCoolDown.formatted())s")
        }
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }

    private func statRow(_ label: String, value: String) -> some View {
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
        .padding(.vertical, 11)
        .background(Color.white.opacity(0.02))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.returnalLightBlue.opacity(0.08)),
            alignment: .bottom
        )
    }
}
