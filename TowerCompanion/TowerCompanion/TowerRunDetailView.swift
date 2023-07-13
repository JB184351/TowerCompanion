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
                            
                            Text("Date Completed: July 11, 2021")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                        } header: {
                            Text("Scout Details")
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.returnalYellow)
                                .padding(.leading)
                        }
                        
                        Spacer()
                        
                        Section {
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
                            Text("Weapon AltFire")
                                .font(.headline)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                            
                            Spacer()
                            
                            ForEach(1..<5) {
                                Spacer()
                                Text("Weapon Trait \($0)")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                            }
                        } header: {
                            Text("Weapon Details")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                        }
                        
                        Spacer()
                        
                        Section {
                            ForEach(1..<16) {
                                Text("Artifact \($0)")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.returnalLightBlue)
                            }
                        } header: {
                            Text("Artifacts")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                        }
                        
                        Spacer()
                        
                        Section {
                            Spacer()
                            ForEach(1..<6) {
                                Text("Parasite \($0)")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.purple)
                            }
                        } header: {
                            Text("Parasites")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.purple)
                        }
                        
                        Spacer()
                        
                        Section {
                            Spacer()
                            ForEach(1..<8) {
                                Text("Malfunction \($0)")
                                    .font(.headline)
                                    .fontDesign(.monospaced)
                                    .padding(.leading)
                                    .foregroundStyle(.red)
                            }
                        } header: {
                            Text("Malfunctions")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.red)
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .backgroundStyle(.returnalDarkGreen)
                
                Group {
                    VStack(alignment: .leading) {
                        Section {
                            Spacer()
                            ForEach(1..<6) {
                                Text("Stat \($0)")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.returnalYellow)
                                    .padding(.leading)

                            }
                        } header: {
                            Text("Stats")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                        }
                        
                        Spacer()
                        
                        Section {
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
                        } header: {
                            Text("Multiplier Details")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .fontDesign(.monospaced)
                                .padding(.leading)
                                .foregroundStyle(.returnalLightBlue)
                        }
                        .backgroundStyle(.red)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                
                
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
