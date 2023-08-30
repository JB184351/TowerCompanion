//
//  TowerRunDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/11/23.
//

import SwiftUI

struct TowerRunDetailView: View {
    
    let towerRun: TowerRun
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HeavyTextHeadline(text: "Scout Name: \(towerRun.scoutName)", color: .returnalYellow)
                    HeavyTextHeadline(text: "Platform: \(towerRun.platform)", color: .returnalYellow)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Score: \(towerRun.score.formatted())", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Phase: \(towerRun.phase)", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Room: \(towerRun.room)", color: .returnalLightBlue)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Final Multiplier: \(towerRun.finalMultiplier)%", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Average Multiplier: \(towerRun.averageMultiplier)%", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Highest Multiplier: \(towerRun.highestMultiplier)%", color: .returnalLightBlue)
                    
                    Spacer()
                    
                    HeavyTextHeadline(text: "Date Started: \(towerRun.dateStarted.formatted())", color: .returnalLightBlue)
                    HeavyTextHeadline(text: "Date Completed: \(towerRun.dateCompleted.formatted())", color: .returnalLightBlue)
                    
                    Spacer()
                    WeaponDetailView(weapon: towerRun.weapon)
                    
                    Spacer()
                    if let artifacts = towerRun.artifacts {
                        if artifacts.count > 0 {
                            ArtifactsDetailView(artifacts: artifacts)
                        }
                    }
                    
                    Spacer()
                    if let parasites = towerRun.parasites {
                        if parasites.count > 0 {
                            ParasitesDetailView(parasites: parasites)
                        }
                    }
                    
                    Spacer()
                    if let malfunctions = towerRun.malfunctions {
                        if malfunctions.count > 0 {
                            MalfunctionsDetailView(malfunctions: malfunctions)
                        }
                    }
                    
                    Spacer()
                    StatsDetailView(stats: towerRun.stats)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Run Details")
            .background(.returnalDarkGreen)
        }
        .scrollIndicators(.automatic)
    }
}

//#Preview {
//    TowerRunDetailView()
//}
