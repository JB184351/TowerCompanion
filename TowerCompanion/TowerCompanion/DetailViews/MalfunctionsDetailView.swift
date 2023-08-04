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
            ForEach(malfunctions, id: \.self) { malfunction in
                DisclosureGroup("Malfunctions") {
                    VStack {
                        TextHeadline(text: malfunction.malfunctionDescription, color: .red)
                        
                        if malfunction.malfunctionType == .normal {
                            TextHeadline(text: malfunction.conditionToRemove, color: .red)
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
