//
//  WeaponDetailView.swift
//  TowerCompanion
//
//  Created by Justin on 7/26/23.
//

import SwiftUI

struct WeaponDetailView: View {
    let weapon: Weapon
    
    var body: some View {
        DisclosureGroup("Weapon Details") {
            VStack {
                Spacer()
                TextHeadline(text: weapon.name, color: .returnalLightBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextHeadline(text: "\(weapon.level)", color: .returnalLightBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            DisclosureGroup(weapon.altFire.name) {
                VStack {
                    TextHeadline(text: weapon.altFire.altFireDescription, color: .returnalLightBlue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.headline)
            .fontDesign(.monospaced)
            .padding(.leading)
            .foregroundStyle(.returnalLightBlue)
            
            Spacer()
            
            DisclosureGroup("Weapon Traits") {
                ForEach(weapon.traits, id: \.name) { weaponTrait in
                    DisclosureGroup(weaponTrait.name + " \(weaponTrait.level)") {
                        VStack {
                            TextHeadline(text: weaponTrait.traitDescription, color: .returnalLightBlue)
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
        .font(.title2)
        .fontWeight(.heavy)
        .fontDesign(.monospaced)
        .padding(.leading)
        .foregroundStyle(.returnalLightBlue)
    }
}

//#Preview {
//    WeaponDetailView(weapon: .constant)
//}
