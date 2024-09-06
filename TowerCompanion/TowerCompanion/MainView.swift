//
//  MainView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Runs", systemImage: "list.dash")
                }
            
            ChartsView(scoresAndDates: ScoresAndDates.mockData())
                .tabItem {
                    Label("Charts", systemImage: "chart.bar")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
