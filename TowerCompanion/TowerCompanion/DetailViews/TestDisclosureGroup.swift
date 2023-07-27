//
//  TestDisclosureGroup.swift
//  TowerCompanion
//
//  Created by Justin on 7/27/23.
//

import SwiftUI

struct TestDisclosureGroup: View {
    var body: some View {
        DisclosureGroup("First Layer") {
            DisclosureGroup("Within The Second Group") {
                ForEach(1..<6) {
                    Text("Item \($0)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TestDisclosureGroup()
}
