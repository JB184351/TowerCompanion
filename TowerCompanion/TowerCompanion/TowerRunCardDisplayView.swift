//
//  TowerRunCardDisplayView.swift
//  TowerCompanion
//
//  Created by Justin on 7/7/23.
//

import SwiftUI

struct TowerRunCardDisplayView: View {
    @State private var name = "DR_JRB"
    @State private var score = 1_136_000
    @State private var date = Date.now.formatted()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .foregroundStyle(.returnalYellow)
                .padding(.leading)
            
            HStack {
                Text("\(score)")
                    .foregroundStyle(Color(red: 168/255, green: 203/255, blue: 196/255))
                    .padding(.leading)
                    .bold()
                    
                Spacer()
                
                Text("\(date)")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing, 20)
            }
            .font(.caption)
            
            HStack {
                Text("Dreadbound")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing)
                
                Spacer()
                
                Text("PS5")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing, 100)
            }
            .font(.caption)
            .padding(.leading)
            
        }
        .padding()
        .background(.returnalDarkGreen)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TowerRunCardDisplayView()
        .previewLayout(.fixed(width: 400, height: 400))
}



