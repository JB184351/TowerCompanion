//
//  WeaponDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct WeaponDetailView: View {
//    let weapon: Weapon
    
    var body: some View {
        DisclosureGroup("Weapon Details") {
            VStack {
                Spacer()
                TextHeaadline(text: "Weapon Name")
                TextHeaadline(text: "Weapon Level: 3")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
                DisclosureGroup("Weapon AltFire") {
                    VStack {
                        TextHeaadline(text: "Weapon Level: 3", color: .returnalLightBlue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.leading)
                .foregroundStyle(.returnalLightBlue)
            
            Spacer()
            
            ForEach(1..<5) { weaponTrait in
                Spacer()
                DisclosureGroup("Weapon Trait \(weaponTrait)") {
                    VStack {
                        TextHeaadline(text: "Weapon Trait \(weaponTrait) Description", color: .returnalLightBlue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.leading)
                .foregroundStyle(.returnalLightBlue)
            }
        }
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalLightBlue)
    }
}

#Preview {
    WeaponDetailView()
}
