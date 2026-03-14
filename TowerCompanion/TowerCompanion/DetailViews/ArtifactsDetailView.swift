//
//  ArtifactsDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct ArtifactsDetailView: View {
    let artifacts: [Artifact]

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(artifacts, id: \.name) { artifact in
                VStack(alignment: .leading, spacing: 5) {
                    Text(artifact.name)
                        .font(.system(size: 11, weight: .heavy, design: .monospaced))
                        .foregroundStyle(Color.returnalLightBlue)
                        .fixedSize(horizontal: false, vertical: true)
                    if !artifact.artifactDescription.isEmpty {
                        Text(artifact.artifactDescription)
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundStyle(Color.returnalLightBlue.opacity(0.5))
                            .lineLimit(3)
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
