//
//  TipsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import SwiftUI

struct TipsView: View {
    @EnvironmentObject private var store: TipStore
    
    var didTapClose: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Spacer()
                Button(action: didTapClose) {
                    Image(systemName: "xmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .gray.opacity(0.2))
                }
            }
            
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
        }
        .background(.returnalDarkGreen, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(8)
    }
}

#Preview {
    TipsView(didTapClose: { })
        .environmentObject(TipStore())
}
