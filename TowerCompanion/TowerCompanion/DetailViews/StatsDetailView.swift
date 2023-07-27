//
//  StatsDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct StatsDetailView: View {
//    let stats: Stats 
    
    var body: some View {
        DisclosureGroup("Stats") {
            Spacer()
            ForEach(1..<6) { stat in
                VStack {
                    HeavyTextHeadline(text: "Stat \(stat) Description", color: .returnalYellow)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalLightBlue)
    }
}

#Preview {
    StatsDetailView()
}
