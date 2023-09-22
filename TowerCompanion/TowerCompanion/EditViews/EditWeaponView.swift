//
//  WeaponEditView.swift
//  TowerCompanion
//
//  Created by Justin on 9/9/23.
//

import SwiftUI

struct EditWeaponView: View {
    @State private var weaponName = "Modified Sidearm SD-M8"
    @State private var weaponLevel = 0
    @State private var altFireName = "Blast Shell"
    @State private var altFireLevel = 1
    @State private var altFIreDescription = ""
    @State private var weaponTraitLevel = 1
    @State private var weaponTraitName = "Homing Missile"
    @State private var weaponTraitNames: [String] = [""]
    @State private var weaponTraits = [Trait]()
    @State private var altFire = AltFire(name: "", level: 1, altFireDescription: "")
    @State private var isFirstView = true
    @Binding var weapon: Weapon
    
    private let weaponNames = ["Modified Sidearm SD-M8", "Hollowseeker", "Electropylon Driver", "Rotgland Lobber", "Pyroshell Caster", "Thermogenic Launcher", "Dreadbound", "Coilspine Shredder", "Tachyomatic Carbine", "Spitmaw Blaster"]
    
    var altFires: [AltFire] {
        return AltFire.getAllAltFires()
    }
    
    init(weapon: Binding<Weapon>) {
        self._weapon = weapon
    }
    
    
    var body: some View {
        Section {
            Picker("Weapon", selection: $weaponName) {
                ForEach(weaponNames, id: \.self) { weaponName in
                    Text("\(weaponName)").tag(weaponName)
                }
            }
            
            Picker("Level", selection: $weaponLevel) {
                ForEach(1..<46) {
                    Text("\($0)").tag($0)
                }
            }
            
            Picker("Alt-Fire", selection: $altFireName) {
                ForEach(altFires, id: \.self) { altFire in
                    Text(altFire.name).tag(altFire.name)
                }
            }
            
            Picker("Alt-Fire Level", selection: $altFireLevel) {
                ForEach(1..<4) {
                    Text("\($0)").tag($0)
                }
            }
            
            Picker("Traits", selection: $weaponTraitName) {
                ForEach(weaponTraitNames, id: \.self) { traitName in
                    Text(traitName).tag(traitName)
                }
            }
            .onChange(of: weaponName) { oldValue, newValue in
                weaponTraitNames = Trait.getWeaponTraits(from: weaponName)
                weaponTraitName = weaponTraitNames[0]
                weaponTraits.removeAll()
            }
            
            Picker("Weapon Trait Level", selection: $weaponTraitLevel) {
                ForEach(1..<4) {
                    Text("\($0)").tag($0)
                }
            }
            
            Button("Add Weapon Trait") {
                withAnimation {
                    addWeaponTrait()
                }
            }
            .disabled(weaponTraits.count == 4)
            
            Button("Clear All") {
                withAnimation {
                    clearValues()
                }
            }
            .disabled(weaponTraits.count < 1)
            
            Section {
                ForEach(weaponTraits, id: \.name) { trait in
                    Text("\(trait.name) \(trait.level)")
                }
            } header: {
                weaponTraits.count > 0 ? Text("Weapon Traits") : Text("")
            }
        }
        .onAppear {
            if isFirstView {
                weaponName = weapon.name
                weaponLevel = weapon.level
                altFireName = weapon.altFire.name
                altFireLevel = weapon.altFire.level
                altFIreDescription = weapon.altFire.altFireDescription
                weaponTraits = weapon.traits
                
                weaponTraitNames = Trait.getWeaponTraits(from: weaponName)
                
                if weaponTraits.count > 0 {
                    for weaponTrait in weaponTraits {
                        if weaponTraitNames.contains(weaponTrait.name) {
                            weaponTraitNames.removeAll(where: { $0 == weaponTrait.name })
                        }
                    }
                }
                
                weaponTraitName = weaponTraitNames[0]
                isFirstView = false
            }
        }
    }
    
    private func addWeaponTrait() {
        let traitDescription = Trait.getWeaponTraitDescriptions(weaponName: weaponName, trait: weaponTraitName)
        
        let trait = Trait(name: weaponTraitName, traitDescription: traitDescription, level: weaponTraitLevel)
        weaponTraits.append(trait)
        
        let altFireDescription = getAltFireDescription(for: altFireName)
        altFire = AltFire(name: altFireName, level: altFireLevel, altFireDescription: altFireDescription)
        
        self.weapon = Weapon(name: weaponName, altFire: altFire, traits: weaponTraits, level: weaponLevel)
        
        weaponTraitNames.removeAll(where: { $0 == weaponTraitName } )
        
        weaponTraitName = weaponTraitNames[0]
    }
    
    private func clearValues() {
        weaponTraits.removeAll()
        weapon.traits = []
        weaponTraitNames = Trait.getWeaponTraits(from: weaponName)
        weaponTraitName = weaponTraitNames[0]
    }
    
    private func addWeapon() {
        let altFireDescription = getAltFireDescription(for: altFireName)
        altFire = AltFire(name: altFireName, level: altFireLevel, altFireDescription: altFireDescription)
        
        self.weapon = Weapon(name: weaponName, altFire: altFire, traits: weaponTraits, level: weaponLevel)
    }
    
    private func getAltFireDescription(for altFireName: String) -> String {
        AltFire.getAllAltFires().first(where: { $0.name == altFireName })?.altFireDescription ?? ""
    }
}

//#Preview {
//    WeaponEditView()
//}
