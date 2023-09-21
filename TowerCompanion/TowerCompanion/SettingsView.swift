//
//  SettingsView.swift
//  TowerCompanion
//
//  Created by Justin on 9/19/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @State private var showTips = false
    @State private var showThanks = false
    @StateObject private var store = TipStore()
    
    var body: some View {
        VStack {
            Button("Tip Me") {
                showTips.toggle()
            }
            .tint(.blue)
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showTips, content: {
            TipsView()
                .environmentObject(store)
        })
        .overlay(alignment: .bottom) {
            if showThanks {
                ThanksView {
                    showThanks = false
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                
            }
        }
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

#Preview {
    SettingsView()
}

