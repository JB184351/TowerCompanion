//
//  ArtifactsDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct ArtifactsDetailView: View {
    let artifacts: [Artifact]

    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    private var columns: [GridItem] {
        if dynamicTypeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        } else {
            return [GridItem(.flexible()), GridItem(.flexible())]
        }
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(artifacts, id: \.name) { artifact in
                VStack(alignment: .leading, spacing: 5) {
                    Text(artifact.name)
                        .returnalFont(size: 11, weight: .heavy)
                        .foregroundStyle(Color.returnalLightBlue)
                        .fixedSize(horizontal: false, vertical: true)
                    if !artifact.artifactDescription.isEmpty {
                        Text(artifact.artifactDescription)
                            .returnalFont(size: 10)
                            .foregroundStyle(Color.returnalLightBlue.opacity(0.5))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(10)
                .background(Color.white.opacity(0.03))
                .overlay(
                    Rectangle()
                        .strokeBorder(Color.returnalLightBlue.opacity(0.2), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
