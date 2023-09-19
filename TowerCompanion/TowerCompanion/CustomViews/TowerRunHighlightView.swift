//
//  TowerRunCardDisplayView.swift
//  TowerCompanion
//
//  Created by Justin on 7/7/23.
//

import SwiftUI

extension HorizontalAlignment {
    
}

struct TowerRunHighlightView: View {
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
            }
            .font(.caption)
            
            HStack {
                Text(towerRun.weapon.name)
                    .foregroundStyle(.returnalLightBlue)
                
                Spacer()
                
                Text(towerRun.platform)
                    .foregroundStyle(.returnalLightBlue)
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



