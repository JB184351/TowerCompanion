//
//  AddWeaponView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/23.
//

import SwiftUI

struct AddWeaponView: View {
    // Weapon Related Variables
    @State private var weaponName = ""
    @State private var weaponLevel = 0
    @State private var altFireName = ""
    @State private var altFireLevel = 0
    @State private var altFIreDescription = ""
    @State private var weaponTraitLevel = 1
    @State private var weaponTraitNamesUsedInRun = [String]()
    @State private var weaponTraitName = ""
    
    private let weaponNames = ["Modified Sidearm SD-M8", "Hollowseeker", "Electropylon Driver", "Rotgland Lobber", "Pyroshell Caster", "Thermogenic Launcher", "Dreadbound", "Coilspine Shredder", "Tachyomatic Carbine", "Spitmaw Blaster"]
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddWeaponView()
}
