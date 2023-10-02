//
//  SettingsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {

    var body: some View {
        NavigationStack {
            NavigationLink("Support the app") {
                TipView()
            }
            .navigationTitle("Settings")
            .frame(alignment: .leading)
        }
    }
}

#Preview {
    SettingsView()
}

