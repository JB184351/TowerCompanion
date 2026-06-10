//
//  SkillDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct SkillDetailView: View {
    let skill: Skill

    var body: some View {
        VStack(spacing: 0) {
            postDeathSubHeader("SKILL")
            postDeathRow("PERFECT FLOORS", value: "\(skill.perfectFloors)")
            postDeathRow("CONSECUTIVE PERFECT", value: "\(skill.consecutivePerfectFloors)")
            postDeathRow("PEAK ADRENALINE", value: "\(skill.peakAdrenaline)")
            postDeathRow("MID-AIR MELEE", value: "\(skill.midairMelee)")
        }
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}
