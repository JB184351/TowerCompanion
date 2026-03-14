//
//  ObjectivesDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct ObjectivesDetailView: View {
    let objectives: Objectives

    var body: some View {
        VStack(spacing: 0) {
            postDeathSubHeader("OBJECTIVES")
            postDeathRow("PYLIOIDS DEFEATED", value: "\(objectives.pylioidsEliminated)")
            postDeathRow("ALGOS DEFEATED", value: "\(objectives.algosDefeated)")
            postDeathRow("ALGOS FINAL FORM", value: "\(objectives.algosFinalFormDefeated)")
            postDeathRow("ALGOS INFINITY FORM", value: "\(objectives.algosInfinityFormDefeated)")
        }
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}
