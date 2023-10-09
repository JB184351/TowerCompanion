//
//  SettingsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    let settingViewsText = ["Support the app"]

    var body: some View {
        NavigationStack {
            Spacer()
            List {
                ForEach(settingViewsText, id: \.self) { setting in
                    NavigationLink(destination: TipView()) {
                        Text(setting)
                    }
                }
            }
            .navigationTitle("Settings")
            .frame(alignment: .leading)
        }
    }
}

#Preview {
    SettingsView()
}

