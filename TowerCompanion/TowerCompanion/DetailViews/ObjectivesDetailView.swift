//
//  ObjectivesDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 9/8/23.
//

import SwiftUI

struct ObjectivesDetailView: View {
    let objectives: Objectives
    
    var body: some View {
        DisclosureGroup("Objectives") {
            Spacer()
            VStack(alignment: .leading) {
                TextHeadline(text: "Pylioids defeated: \(objectives.pylioidsEliminated)", color: .returnalLightBlue)
                TextHeadline(text: "Algos defeated: \(objectives.algosDefeated)", color: .returnalLightBlue)
                TextHeadline(text: "Algos Final form defeated: \(objectives.algosFinalFormDefeated)", color: .returnalLightBlue)
                TextHeadline(text: "Algos Infinity forms defeated: \(objectives.algosInfinityFormDefeated)", color: .returnalLightBlue)
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
//    ObjectivesDetailView()
//}
