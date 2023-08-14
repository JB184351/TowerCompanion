//
//  ParasitesDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct ParasitesDetailView: View {
    let parasites: [Parasite]

    var body: some View {
        DisclosureGroup("Parasites") {
            Spacer()
            ForEach(parasites, id: \.self) { parasite in
                DisclosureGroup("\(parasite.name)") {
                    VStack {
                        TextHeadline(text: parasite.positiveDescription, color: .green)
                        TextHeadline(text: parasite.negativeDescription, color: .red)
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

//#Preview {
//    ParasitesDetailView()
//}
