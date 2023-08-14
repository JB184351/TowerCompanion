//
//  ArtifactsDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct ArtifactsDetailView: View {
    let artifacts: [Artifact] 
    
    var body: some View {
        DisclosureGroup("Artifacts") {
            ForEach(artifacts, id: \.name) { artifact in
                DisclosureGroup(artifact.name) {
                    VStack {
                        TextHeadline(text: artifact.artifactDescription, color: .returnalLightBlue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .font(.headline)
            .fontDesign(.monospaced)
            .padding(.leading)
            .foregroundStyle(.returnalLightBlue)
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalLightBlue)
    }
}

//#Preview {
//    ArtifactsDetailView()
//}
