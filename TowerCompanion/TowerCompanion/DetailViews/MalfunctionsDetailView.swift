//
//  MalfunctionsDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct MalfunctionsDetailView: View {
    let malfunctions: [Malfunction]
    
    var body: some View {
        DisclosureGroup("Malfunctions") {
            Spacer()
            ForEach(Array(malfunctions.enumerated()), id: \.element) { (offset, malfunction) in
                DisclosureGroup("Malfunction \(offset + 1)") {
                    VStack {
                        TextHeadline(text: malfunction.malfunctionDescription, color: .red)
                            .padding(.leading)
                        
                        if malfunction.malfunctionType == .normal {
                            TextHeadline(text: malfunction.conditionToRemove, color: .red)
                                .padding(.leading)
                        }
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

//#Preview {
//    MalfunctionsDetailView()
//}
