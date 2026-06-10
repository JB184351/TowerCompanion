//
//  ParasitesDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct ParasitesDetailView: View {
    let parasites: [Parasite]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(parasites, id: \.self) { parasite in
                VStack(alignment: .leading, spacing: 8) {
                    Text(parasite.name)
                        .returnalFont(size: 13, weight: .heavy)
                        .foregroundStyle(Color.returnalPurple)

                    HStack(alignment: .top, spacing: 6) {
                        Text("+")
                            .returnalFont(size: 11, weight: .bold)
                            .foregroundStyle(Color.green)
                            .frame(width: 10)
                        Text(parasite.positiveDescription)
                            .returnalFont(size: 11)
                            .foregroundStyle(Color.green.opacity(0.85))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    HStack(alignment: .top, spacing: 6) {
                        Text("−")
                            .returnalFont(size: 11, weight: .bold)
                            .foregroundStyle(Color.red)
                            .frame(width: 10)
                        Text(parasite.negativeDescription)
                            .returnalFont(size: 11)
                            .foregroundStyle(Color.red.opacity(0.85))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white.opacity(0.03))
                .overlay(
                    Rectangle()
                        .strokeBorder(Color.returnalPurple.opacity(0.35), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
