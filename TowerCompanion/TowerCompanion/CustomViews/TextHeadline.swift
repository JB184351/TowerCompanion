//
//  TextHeaadline.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct TextHeadline: View {
    var text = "Testing"
    var color: Color = .returnalLightBlue
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontDesign(.monospaced)
            .padding(.leading)
            .foregroundStyle(color)
    }
}

#Preview {
    TextHeadline()
}
