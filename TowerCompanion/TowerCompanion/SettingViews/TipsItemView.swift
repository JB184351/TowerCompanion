//
//  TipsItemView.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import SwiftUI
import StoreKit

struct TipsItemView: View {
    @EnvironmentObject private var store: TipStore
    let item: Product?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item?.displayName ?? "-")
                    .bold()
                Text(item?.description ?? "-")
            }
            
            Spacer()
            
            Button(item?.displayPrice ?? "-") {
                if let item = item {
                    Task {
                        await store.purchase(item)
                    }
                }
            }
            .tint(.returnalYellow)
            .buttonStyle(.bordered)
            .font(.callout.bold())
        }
    }
}

#Preview {
    TipsItemView(item: nil)
        .environmentObject(TipStore())
}
