//
//  MalfunctionsDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct MalfunctionsDetailView: View {
//    let malfunctions: [Malfunction]
    
    var body: some View {
        DisclosureGroup("Malfunctions") {
            Spacer()
            ForEach(1..<8) { malfunction in
                DisclosureGroup("Malfunction \(malfunction)") {
                    VStack {
                        TextHeaadline(text: "Malfunction \(malfunction) Description", color: .red)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.leading)
                .foregroundStyle(.red)
                
            }
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.red)
    }
}

#Preview {
    MalfunctionsDetailView()
}
