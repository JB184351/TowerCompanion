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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Button("Tip Me") {
                showTips.toggle()
            }
            .tint(.blue)
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if showTips {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        showTips.toggle()
                    }
                
                TipsView {
                    showTips.toggle()
                }
                .environmentObject(store)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .overlay(alignment: .bottom) {
            if showThanks {
                ThanksView {
                    showThanks = false
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.spring(), value: showTips)
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

#Preview {
    SettingsView()
}

