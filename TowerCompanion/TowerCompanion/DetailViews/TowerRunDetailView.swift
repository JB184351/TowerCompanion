//
//  TowerRunDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/11/23.
//

import SwiftUI

struct TowerRunDetailView: View {
    
    let towerRun: TowerRun
    @State private var isEditViewPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        HeavyTextHeadline(text: "Scout Name: \(towerRun.scoutName)", color: .returnalYellow)
                        HeavyTextHeadline(text: "Platform: \(towerRun.platform)", color: .returnalYellow)
                    }

                    VStack(alignment: .leading) {
                        HeavyTextHeadline(text: "Score: \(towerRun.score.formatted())", color: .returnalLightBlue)
                        HeavyTextHeadline(text: "Phase: \(towerRun.phase)", color: .returnalLightBlue)
                        HeavyTextHeadline(text: "Room: \(towerRun.room)", color: .returnalLightBlue)
                    }
                    
                    VStack(alignment: .leading) {
                        HeavyTextHeadline(text: "Final Multiplier: \(towerRun.finalMultiplier)%", color: .returnalLightBlue)
                        HeavyTextHeadline(text: "Average Multiplier: \(towerRun.averageMultiplier)%", color: .returnalLightBlue)
                        HeavyTextHeadline(text: "Highest Multiplier: \(towerRun.highestMultiplier)%", color: .returnalLightBlue)
                    }
                 
                    VStack(alignment: .leading) {
                        HeavyTextHeadline(text: "Date Started: \(towerRun.dateStarted.formatted())", color: .returnalLightBlue)
                        HeavyTextHeadline(text: "Date Completed: \(towerRun.dateCompleted.formatted())", color: .returnalLightBlue)
                    }
                    
                    VStack(alignment: .leading)  {
                        WeaponDetailView(weapon: towerRun.weapon)
                        
                        if let artifacts = towerRun.artifacts {
                            if artifacts.count > 0 {
                                ArtifactsDetailView(artifacts: artifacts)
                            }
                        }
                        
                        
                        if let parasites = towerRun.parasites {
                            if parasites.count > 0 {
                                ParasitesDetailView(parasites: parasites)
                            }
                        }
                        
                        if let malfunctions = towerRun.malfunctions {
                            if malfunctions.count > 0 {
                                MalfunctionsDetailView(malfunctions: malfunctions)
                            }
                        }
                        
                        StatsDetailView(stats: towerRun.stats)
                        
                        if let combatValues = towerRun.combat {
                            CombatDetailView(combat: combatValues)
                        }
                        
                        if let explorer = towerRun.explorer {
                            ExplorerDetailsView(explorer: explorer)
                        }
                        
                        if let skill = towerRun.skill {
                            SkillDetailView(skill: skill)
                        }
                        
                        if let objectives = towerRun.objectives {
                            ObjectivesDetailView(objectives: objectives)
                        }
                    }
                    
                }
            }
            .navigationTitle("Run Details")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .padding(12)
            .background(.returnalDarkGreen)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        isEditViewPresented = true
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    let runText = CreateText.createText(for: towerRun)
                    if let url = CreateText.createTextFile(withContent: runText, fileName: "run.txt") {
                        ShareLink(item: url, preview: SharePreview("Tower Run"))
                    }
                }
            }
            .sheet(isPresented: $isEditViewPresented, content: {
                EditRunView(towerRun: towerRun)
            })
        }
        .scrollIndicators(.automatic)
    }
}

//#Preview {
//    TowerRunDetailView()
//}
