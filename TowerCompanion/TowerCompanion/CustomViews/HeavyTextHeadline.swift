//
//  HeavyTextHeadline.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct HeavyTextHeadline: View {
    var text = "Testing"
    var color: Color = .returnalLightBlue
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.heavy)
            .fontDesign(.monospaced)
            .padding(.leading)
            .foregroundStyle(color)
    }
}

#Preview {
    HeavyTextHeadline()
}
