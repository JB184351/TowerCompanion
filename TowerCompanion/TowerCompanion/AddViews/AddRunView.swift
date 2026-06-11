//
//  AddRunView.swift
//  TowerCompanion
//

import SwiftUI

struct AddRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext

    @State private var scoutName = ""
    @State private var platform = "PS5"
    private let platforms = ["PS5", "PC"]

    @State var weapon: Weapon = Weapon(name: "Modified Sidearm SD-M8", altFire: AltFire(name: "Blast Shell", level: 1, altFireDescription: "Lobs a grenade-light projectile that explodes on contact with an enemy, or after enough time has passed."), traits: [], level: 1)
    @State var artifacts: [Artifact] = []
    @State var parasites: [Parasite] = []
    @State var malfunctions: [Malfunction] = []
    @State var combatValues: Combat?
    @State var explorerValues: Explorer?
    @State var skillValues: Skill?
    @State var objectiveValues: Objectives?

    // Stats
    @State private var weaponDamageStat = 0.0
    @State private var protectionStat = 0.0
    @State private var proficiencyRate = 0.0
    @State private var repairEffiency = 0.0
    @State private var altFireCooldown = 0.0

    // Score
    @State private var score = "0"
    @State private var finalMultiplier = "0.0"
    @State private var averageMutliplier = "0.0"
    @State private var highestMultplier = "0.0"

    // Phase and Room
    @State private var phase = "1"
    @State private var room = 1

    // Date
    @State private var dateStarted = Date.now
    @State private var dateCompleted = Date.now

    @FocusState private var textFieldFocus: FocusField?

    var body: some View {
        NavigationStack {
            Form {

                // MARK: - Scout
                Section {
                    TextField("Scout name", text: $scoutName)
                        .focused($textFieldFocus, equals: .text)
                    Picker("Platform", selection: $platform) {
                        ForEach(platforms, id: \.self) { Text($0).tag($0) }
                    }
                } header: {
                    ReturnalFormHeader("SCOUT")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Weapon (sub-view owns its sections)
                AddWeaponView(weapon: $weapon)

                // MARK: - Score & Location
                Section {
                    TextField("Score", text: $score)
                        .numbersOnly($score)
                        .focused($textFieldFocus, equals: .int)
                    TextField("Phase", text: $phase)
                        .numbersOnly($phase)
                        .focused($textFieldFocus, equals: .int)
                    Picker("Room", selection: $room) {
                        ForEach(1..<21) { Text(String($0)).tag($0) }
                    }
                } header: {
                    ReturnalFormHeader("SCORE & LOCATION")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Multipliers
                Section {
                    TextField("Average ×", text: $averageMutliplier)
                        .numbersOnly($averageMutliplier, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)
                    TextField("Highest ×", text: $highestMultplier)
                        .numbersOnly($highestMultplier, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)
                    TextField("Final ×", text: $finalMultiplier)
                        .numbersOnly($finalMultiplier, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)
                } header: {
                    ReturnalFormHeader("MULTIPLIERS")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Suit Stats
                Section {
                    Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: -150...150, step: 5)
                    Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: -150...150, step: 5)
                    Stepper("Repair Efficiency \(repairEffiency.formatted())%", value: $repairEffiency, in: -150...150, step: 5)
                    Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted())s", value: $altFireCooldown, in: -30...30, step: 5)
                    Stepper("Proficiency Rate \(proficiencyRate.formatted())%", value: $proficiencyRate, in: -150...150, step: 5)
                } header: {
                    ReturnalFormHeader("SUIT STATS")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Artifacts (sub-view owns its sections)
                AddArtifactsView(artifacts: $artifacts)

                // MARK: - Parasites (sub-view owns its sections)
                AddParasitesView(parasites: $parasites)

                // MARK: - Malfunctions (sub-view owns its sections)
                AddMalfunctionsView(malfunctions: $malfunctions)

                // MARK: - Post-Death Data
                Section {
                    NavigationLink("Combat", destination: AddCombatValuesView(combatValues: $combatValues))
                    NavigationLink("Explorer", destination: AddExplorerValuesView(explorerValues: $explorerValues))
                    NavigationLink("Skill", destination: AddSkillValuesView(skillValues: $skillValues))
                    NavigationLink("Objectives", destination: AddObjectivesValueView(objectiveValues: $objectiveValues))
                } header: {
                    ReturnalFormHeader("POST-DEATH DATA")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Run Dates
                Section {
                    DatePicker("Started", selection: $dateStarted)
                    DatePicker("Completed", selection: $dateCompleted)
                } header: {
                    ReturnalFormHeader("RUN DATES")
                }
                .listRowBackground(Color.white.opacity(0.05))
            }
            .scrollContentBackground(.hidden)
            .background(Color.returnalDarkGreen)
            .fontDesign(.monospaced)
            .foregroundStyle(Color.returnalLightBlue)
            .navigationTitle("NEW RUN")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("ADD RUN") {
                        addTowerRun()
                        dismiss()
                    }
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.returnalYellow)
                }

                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }

                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = nil
                    }
                    .fontDesign(.monospaced)
                }
            }
        }
    }

    func addTowerRun() {
        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, proficiencyRate: proficiencyRate, repairEfficiency: repairEffiency, altFireCoolDown: altFireCooldown)

        let towerRun = TowerRun(scoutName: scoutName, weapon: weapon, artifacts: artifacts, parasites: parasites, stats: stats, malfunctions: malfunctions, score: Int(score) ?? 0, multiplier: Double(finalMultiplier) ?? 0.0, averageMultiplier: Double(averageMutliplier) ?? 0.0, highestMultplier: Double(highestMultplier) ?? 0, phase: Int(phase) ?? 0, room: room, platform: platform, combat: combatValues, explorer: explorerValues, skill: skillValues, objectives: objectiveValues, dateStarted: dateStarted, dateCompleted: dateCompleted)

        modelContext.insert(towerRun)
        try? modelContext.save()
    }
}

// MARK: - Section Header

struct ReturnalFormHeader: View {
    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text("◈  \(title)")
            .font(.system(size: 10, weight: .heavy, design: .monospaced))
            .foregroundStyle(Color.returnalYellow)
            .kerning(3)
    }
}
