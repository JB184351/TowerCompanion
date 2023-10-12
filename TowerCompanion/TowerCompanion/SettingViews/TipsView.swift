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
        VStack(spacing: 8) {
            Spacer()
            
            Text("Enjoying the app so far?")
                .font(.system(.title2, design: .rounded).bold())
                .multilineTextAlignment(.center)
            
            Text("Please support the Tower Companion app by leaving a tip.")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            ForEach(store.items) { item in
                Section {
                    TipsItemView(item: item)
                }
            }
            Spacer()
            Spacer()
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.returnalDarkGreen)
        
    }
}

#Preview {
    TipsView()
        .environmentObject(TipStore())
}
