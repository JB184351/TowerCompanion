//
//  TipView.swift
//  TowerCompanion
//
//  Created by Justin on 9/30/23.
//

import SwiftUI

struct TipView: View {
    @State private var showTips = false
    @State private var showThanks = false
    @StateObject private var store = TipStore()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TipsView()
                .environmentObject(store)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                if showThanks {
                    ThanksView {
                        showThanks = false
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(.spring(), value: showThanks)
            .onChange(of: store.action, { oldValue, newValue in
                if newValue == .successful {
                    showTips = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showThanks = true
                        store.reset()
                    }
                }
            })
        .alert(isPresented: $store.hasError, error: store.error) {}
        }
    }
}

#Preview {
    TipView()
}
