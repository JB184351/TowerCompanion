//
//  ExplorerDetailsView.swift
//  TowerCompanion
//

import SwiftUI

struct ExplorerDetailsView: View {
    let explorer: Explorer

    var body: some View {
        VStack(spacing: 0) {
            postDeathSubHeader("EXPLORER")
            postDeathRow("FLOORS CLEARED", value: "\(explorer.floorsCleared)")
            postDeathRow("SILPHIUM FOUND", value: "\(explorer.silphiumFound)")
            postDeathRow("OBOLITES COLLECTED", value: "\(explorer.obolitesCollected)")
            postDeathRow("CALIBRATORS COLLECTED", value: "\(explorer.calibratorsCollected)")
        }
        .overlay(
            Rectangle()
                .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}
