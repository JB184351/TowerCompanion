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
                Text("Score: \(score)")
                    .foregroundStyle(Color(red: 168/255, green: 203/255, blue: 196/255))
                    .padding(.leading)
                    .bold()
                    
                Spacer()
                
                Text("\(date)")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing)
            }
            .font(.caption)
            
            HStack {
                Text("\(date)")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing)
                
                Spacer()
                
                Text("\(date)")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing)
            }
            .font(.caption)
            .padding(.leading)
            
        }
        .background(.returnalDarkGreen)
        .clipShape(Capsule())
        .padding()
    }
}

#Preview {
    TowerRunCardDisplayView()
        .previewLayout(.fixed(width: 400, height: 400))
}

extension ShapeStyle where Self == Color {
    static var returnalYellow: Color {
        Color(red: 238/255, green: 218/255, blue: 32/255)
    }
    
    static var returnalLightBlue: Color {
        Color(red: 168/255, green: 203/255, blue: 196/255)
    }
    
    static var returnalDarkGreen: Color {
        Color(red: 16/255, green: 25/255, blue: 25/255)
    }
}

