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
                Group {
                    VStack(alignment: .leading) {
                        Section {
                            Text("Scout Name: DR_JRB")
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.returnalYellow)
                                .padding(.leading)
                            Text("Platform: PS5")
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.returnalYellow)
                                .padding(.leading)
                            
                            Spacer()
            
                            Text("Score: \(score)")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            Text("Phase: 3")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            
                            Text("Room: 19")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            
                            Spacer()
                            
                            Group {
                                Text("Final Multiplier: 98.2%")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                                Text("Average Multiplier: 68.9%")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                                Text("Highest Multiplier: 100%")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                                
                                Spacer()
                                
                                Text("Date Completed: July 11, 2021")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                            }
                            
                            
                        }
                        
                        Spacer()
                        
                        DisclosureGroup("Weapon Details") {
                            VStack {
                                Text("Weapon Name")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                                
                                Text("Weapon Level")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                                DisclosureGroup("Weapon AltFire") {
                                    VStack {
                                        Text("Weapon AltFire Description")
                                            .font(.headline)
                                            .fontDesign(.monospaced)
                                            .padding(.leading)
                                        .foregroundStyle(.returnalLightBlue)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            
                            Spacer()
                            
                            ForEach(1..<5) { weaponTrait in
                                Spacer()
                                DisclosureGroup("Weapon Trait \(weaponTrait)") {
                                    VStack {
                                        Text("Weapon Trait \(weaponTrait) Description")
                                            .font(.headline)
                                            .fontDesign(.monospaced)
                                            .padding(.leading)
                                            .foregroundStyle(.returnalLightBlue)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            }
                        }
                        .font(.title2)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                        .padding(.leading)
                        .foregroundStyle(.returnalLightBlue)
                        
                        
                        Spacer()
                        
                        DisclosureGroup("Artifacts") {
                            ForEach(1..<16) { artifact in
                                DisclosureGroup("Artifact \(artifact)") {
                                    VStack {
                                        Text("Artifact \(artifact) Description")
                                            .font(.headline)
                                            .fontDesign(.monospaced)
                                            .padding(.leading)
                                        .foregroundStyle(.returnalLightBlue)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .font(.headline)
                            .fontDesign(.monospaced)
                            .padding(.leading)
                            .foregroundStyle(.returnalLightBlue)
                        }
                        .font(.title2)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                        .padding(.leading)
                        .foregroundStyle(.returnalLightBlue)
                        
                        Spacer()
                        
                        DisclosureGroup("Parasites") {
                            Spacer()
                            ForEach(1..<6) { parasite in
                                DisclosureGroup("Parasite \(parasite)") {
                                    VStack {
                                        Text("Parasite \(parasite) Description")
                                            .font(.headline)
                                            .fontDesign(.monospaced)
                                            .padding(.leading)
                                            .foregroundStyle(.purple)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.purple)
                            }
                        }
                        .font(.title2)
                        .fontWeight(.heavy)
                        .fontDesign(.monospaced)
                        .padding(.leading)
                        .foregroundStyle(.purple)
                        
                        Spacer()
                        
                        DisclosureGroup("Malfunctions") {
                            Spacer()
                            ForEach(1..<8) { malfunction in
                                DisclosureGroup("Malfunction \(malfunction)") {
                                    VStack {
                                        Text("Malfunction \(malfunction) Description")
                                            .font(.headline)
                                            .fontDesign(.monospaced)
                                            .padding(.leading)
                                            .foregroundStyle(.red)
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
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .backgroundStyle(.returnalDarkGreen)
                
                DisclosureGroup("Stats") {
                    Spacer()
                    ForEach(1..<6) { stat in
                        VStack {
                            Text("Stat \(stat) Description")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.returnalYellow)
                            .padding(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                .font(.title2)
                .fontWeight(.heavy)
                .fontDesign(.monospaced)
                .padding(.leading)
                .foregroundStyle(.returnalLightBlue)
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
