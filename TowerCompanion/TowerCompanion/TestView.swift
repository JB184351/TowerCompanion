//
//  TestView.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import SwiftUI
import StoreKit

struct TestView: View {
    @State private var myProduct: Product?
    
    var body: some View {
        VStack {
            Text("Product Info")
            Text(myProduct?.displayName ?? "")
            Text(myProduct?.description ?? "")
            Text(myProduct?.displayPrice ?? "")
        }
        .task {
            myProduct = try? await Product.products(for: ["com.justinbengtson.TowerCompaniontinyTip"]).first
        }
    }
}

#Preview {
    TestView()
}
