//
//  TowerRunDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/11/23.
//

import SwiftUI

struct TowerRunDetailView: View {
    
    //    let towerRun: TowerRun
    var score = 132_350_343
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HeavyTextHeadline(text: "Scout Name: DR_JRB", color: .returnalYellow)
                    HeavyTextHeadline(text: "PS5", color: .returnalYellow)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Score: \(score)", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Phase: 3", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Room: 19", color: .returnalLightBlue)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Final Multiplier: 98.2%", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Average Multiplier: 68.9%", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Highest Multiplier: 100%", color: .returnalLightBlue)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Date Completed: July 11, 2021", color: .returnalLightBlue)
                    
                    Spacer()
                    WeaponDetailView()
                    
                    Spacer()
                    ArtifactsDetailView()
                    
                    Spacer()
                    ParasitesDetailView()
                    
                    Spacer()
                    MalfunctionsDetailView()
                    
                    Spacer()
                    StatsDetailView()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .backgroundStyle(.returnalDarkGreen)
            }
            .navigationTitle("Run Details")
            .background(.returnalDarkGreen)
        }
        .scrollIndicators(.automatic)
    }
}

#Preview {
    TowerRunDetailView()
}
