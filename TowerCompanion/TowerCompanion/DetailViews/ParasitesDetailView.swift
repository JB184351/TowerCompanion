//
//  ParasitesDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct ParasitesDetailView: View {
//    let parasites: [Parasite]

    var body: some View {
        DisclosureGroup("Parasites") {
            Spacer()
            ForEach(1..<6) { parasite in
                DisclosureGroup("Parasite \(parasite)") {
                    VStack {
                        TextHeaadline(text: "Parasite \(parasite) Description", color: .returnalPurple)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.leading)
                .foregroundStyle(.returnalPurple)
            }
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalPurple)
    }
}

#Preview {
    ParasitesDetailView()
}
