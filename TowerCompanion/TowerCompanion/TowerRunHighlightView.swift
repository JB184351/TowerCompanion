//
//  TowerRunCardDisplayView.swift
//  TowerCompanion
//
//  Created by Justin on 7/7/23.
//

import SwiftUI

struct TowerRunHighlightView: View {
    @State private var scoutName = "DR_JRB"
    @State private var score = 1_136_000
    @State private var platform = "PS5"
    @State private var weaponName = "Dreadbound"
    @State private var dateCompleted = Date.now
    
    let towerRun: TowerRun
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(towerRun.scoutName)
                .font(.headline)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .foregroundStyle(.returnalYellow)
                .padding(.leading)
            
            HStack {
                Text("\(towerRun.score)")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.leading)
                    .bold()
                    
                Spacer()
                
                Text("\(towerRun.dateCompleted.formatted())")
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing, 20)
            }
            .font(.caption)
            
            HStack {
                Text(towerRun.weapon.name)
                    .foregroundStyle(.returnalLightBlue)
                    .padding(.trailing)
                
                Spacer()
                
                Text(towerRun.platform)
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

//#Preview {
//    TowerRunHighlightView()
//}



