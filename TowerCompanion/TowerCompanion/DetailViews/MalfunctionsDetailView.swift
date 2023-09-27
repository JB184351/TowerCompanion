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
            ForEach(0..<malfunctions.count) { i in
                DisclosureGroup("Malfunction \(i + 1)") {
                    VStack {
                        TextHeadline(text: malfunctions[i].malfunctionDescription, color: .red)
                            .padding(.leading)
                        
                        if malfunctions[i].malfunctionType == .normal {
                            TextHeadline(text: malfunctions[i].conditionToRemove, color: .red)
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
