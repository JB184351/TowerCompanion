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
                        .font(.system(size: 13, weight: .heavy, design: .monospaced))
                        .foregroundStyle(Color.returnalPurple)

                    HStack(alignment: .top, spacing: 6) {
                        Text("+")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundStyle(Color.green)
                            .frame(width: 10)
                        Text(parasite.positiveDescription)
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundStyle(Color.green.opacity(0.85))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    HStack(alignment: .top, spacing: 6) {
                        Text("−")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundStyle(Color.red)
                            .frame(width: 10)
                        Text(parasite.negativeDescription)
                            .font(.system(size: 11, design: .monospaced))
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
