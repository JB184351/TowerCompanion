//
//  WeaponDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct WeaponDetailView: View {
    let weapon: Weapon

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Name + level
            HStack(alignment: .firstTextBaseline) {
                Text(weapon.name)
                    .font(.system(size: 15, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 8)
                Text("LVL \(weapon.level)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.returnalYellow)
                    .kerning(1)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .overlay(
                        Rectangle()
                            .strokeBorder(Color.returnalYellow.opacity(0.5), lineWidth: 1)
                    )
            }

            // Alt-fire
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 8) {
                    Text("ALT-FIRE")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundStyle(Color.returnalLightBlue.opacity(0.5))
                        .kerning(2)
                    Text("LVL \(weapon.altFire.level)")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundStyle(Color.returnalYellow.opacity(0.7))
                        .kerning(1)
                }
                Text(weapon.altFire.name)
                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue)
                if !weapon.altFire.altFireDescription.isEmpty {
                    Text(weapon.altFire.altFireDescription)
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundStyle(Color.returnalLightBlue.opacity(0.55))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.03))
            .overlay(
                Rectangle()
                    .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
            )

            // Traits
            if !weapon.traits.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("TRAITS")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundStyle(Color.returnalLightBlue.opacity(0.5))
                        .kerning(2)

                    ForEach(weapon.traits, id: \.name) { trait in
                        HStack(alignment: .top, spacing: 8) {
                            Text("◦")
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundStyle(Color.returnalYellow.opacity(0.6))
                            VStack(alignment: .leading, spacing: 3) {
                                HStack(spacing: 8) {
                                    Text(trait.name)
                                        .font(.system(size: 13, weight: .semibold, design: .monospaced))
                                        .foregroundStyle(Color.returnalLightBlue)
                                    Text("LVL \(trait.level)")
                                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                                        .foregroundStyle(Color.returnalYellow.opacity(0.7))
                                        .kerning(1)
                                }
                                if !trait.traitDescription.isEmpty {
                                    Text(trait.traitDescription)
                                        .font(.system(size: 11, design: .monospaced))
                                        .foregroundStyle(Color.returnalLightBlue.opacity(0.55))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.opacity(0.03))
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}
