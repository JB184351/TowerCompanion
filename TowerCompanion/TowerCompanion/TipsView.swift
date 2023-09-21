//
//  TipsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import SwiftUI

struct TipsView: View {
    @EnvironmentObject private var store: TipStore
    
    var body: some View {
        ForEach(store.items) { item in
            Section {
                TipsItemView(item: item)
            }
        }
    }
}

#Preview {
    TipsView()
        .environmentObject(TipStore())
}
