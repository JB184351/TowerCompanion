//
//  ExplorerDetailsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/8/23.
//

import SwiftUI

struct ExplorerDetailsView: View {
    let explorer: Explorer
    
    var body: some View {
        DisclosureGroup("Explorer") {
            Spacer()
            VStack(alignment: .leading) {
                TextHeadline(text: "Floors Cleared: \(explorer.floorsCleared)", color: .returnalLightBlue)
                TextHeadline(text: "Silphium Found: \(explorer.silphiumFound)", color: .returnalLightBlue)
                TextHeadline(text: "Obolites Collected: \(explorer.obolitesCollected)", color: .returnalLightBlue)
                TextHeadline(text: "Calibrators Collected: \(explorer.calibratorsCollected)", color: .returnalLightBlue)
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
//    ExplorerDetailsView()
//}
