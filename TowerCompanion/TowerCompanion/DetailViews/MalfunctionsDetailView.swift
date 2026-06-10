//
//  MalfunctionsDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct MalfunctionsDetailView: View {
    let malfunctions: [Malfunction]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(Array(malfunctions.enumerated()), id: \.element) { index, malfunction in
                VStack(alignment: .leading, spacing: 7) {
                    HStack {
                        Text("MALFUNCTION \(index + 1)")
                            .returnalFont(size: 9, weight: .bold)
                            .foregroundStyle(Color.red.opacity(0.7))
                            .kerning(2)
                        Spacer()
                        if malfunction.malfunctionType != .normal {
                            Text("PERMANENT")
                                .returnalFont(size: 9, weight: .bold)
                                .foregroundStyle(Color.red.opacity(0.7))
                                .kerning(1)
                        }
                    }

                    Text(malfunction.malfunctionDescription)
                        .returnalFont(size: 12)
                        .foregroundStyle(Color.red.opacity(0.9))
                        .fixedSize(horizontal: false, vertical: true)

                    if malfunction.malfunctionType == .normal && !malfunction.conditionToRemove.isEmpty {
                        HStack(alignment: .top, spacing: 5) {
                            Text("REMOVE:")
                                .returnalFont(size: 9, weight: .bold)
                                .foregroundStyle(Color.returnalLightBlue.opacity(0.55))
                                .kerning(1)
                            Text(malfunction.conditionToRemove)
                                .returnalFont(size: 11)
                                .foregroundStyle(Color.returnalLightBlue.opacity(0.7))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red.opacity(0.05))
                .overlay(
                    Rectangle()
                        .strokeBorder(Color.red.opacity(0.3), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
