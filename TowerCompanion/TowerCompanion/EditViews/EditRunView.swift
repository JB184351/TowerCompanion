//
//  EditRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/21/23.
//

import SwiftUI

struct EditRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var towerRun: TowerRun

    private let platforms = ["PS5", "PC"]

    @FocusState private var textFieldFocus: FocusField?

    var body: some View {
        NavigationStack {
            Form {

                // MARK: - Scout
                Section {
                    TextField("Scout name", text: $towerRun.scoutName)
                        .focused($textFieldFocus, equals: .text)
                    Picker("Platform", selection: $towerRun.platform) {
                        ForEach(platforms, id: \.self) { Text($0).tag($0) }
                    }
                } header: {
                    ReturnalFormHeader("SCOUT")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Weapon (sub-view owns its sections)
                EditWeaponView(weapon: $towerRun.weapon)

                // MARK: - Score & Location
                Section {
                    let scoreBinding = Binding<String>(
                        get: { String(towerRun.score) },
                        set: { towerRun.score = Int($0) ?? towerRun.score }
                    )
                    TextField("Score", text: scoreBinding)
                        .numbersOnly(scoreBinding)
                        .focused($textFieldFocus, equals: .int)

                    let phaseBinding = Binding<String>(
                        get: { String(towerRun.phase) },
                        set: { towerRun.phase = Int($0) ?? towerRun.phase }
                    )
                    TextField("Phase", text: phaseBinding)
                        .numbersOnly(phaseBinding)
                        .focused($textFieldFocus, equals: .int)

                    Picker("Room", selection: $towerRun.room) {
                        ForEach(1..<21) { Text(String($0)).tag($0) }
                    }
                } header: {
                    ReturnalFormHeader("SCORE & LOCATION")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Multipliers
                Section {
                    let averageBinding = Binding<String>(
                        get: { String(towerRun.averageMultiplier) },
                        set: { towerRun.averageMultiplier = Double($0) ?? towerRun.averageMultiplier }
                    )
                    TextField("Average ×", text: averageBinding)
                        .numbersOnly(averageBinding, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)

                    let highestBinding = Binding<String>(
                        get: { String(towerRun.highestMultiplier) },
                        set: { towerRun.highestMultiplier = Double($0) ?? towerRun.highestMultiplier }
                    )
                    TextField("Highest ×", text: highestBinding)
                        .numbersOnly(highestBinding, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)

                    let finalBinding = Binding<String>(
                        get: { String(towerRun.finalMultiplier) },
                        set: { towerRun.finalMultiplier = Double($0) ?? towerRun.finalMultiplier }
                    )
                    TextField("Final ×", text: finalBinding)
                        .numbersOnly(finalBinding, includeDecimal: true)
                        .focused($textFieldFocus, equals: .dec)
                } header: {
                    ReturnalFormHeader("MULTIPLIERS")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Suit Stats
                Section {
                    Stepper("Weapon Damage \(towerRun.stats.weaponDamage.formatted())%", value: $towerRun.stats.weaponDamage, in: -150...150, step: 5)
                    Stepper("Protection \(towerRun.stats.protection.formatted())%", value: $towerRun.stats.protection, in: -150...150, step: 5)
                    Stepper("Repair Efficiency \(towerRun.stats.repairEfficiency.formatted())%", value: $towerRun.stats.repairEfficiency, in: -150...150, step: 5)
                    Stepper("Alt-Fire Cooldown \(towerRun.stats.altFireCoolDown.formatted())s", value: $towerRun.stats.altFireCoolDown, in: -30...30, step: 5)
                    Stepper("Proficiency Rate \(towerRun.stats.proficiencyRate.formatted())%", value: $towerRun.stats.proficiencyRate, in: -150...150, step: 5)
                } header: {
                    ReturnalFormHeader("SUIT STATS")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Artifacts (sub-view owns its sections)
                EditArtifactsView(artifacts: $towerRun.artifacts)

                // MARK: - Parasites (sub-view owns its sections)
                EditParasitesView(parasites: Binding(
                    get: { towerRun.parasites ?? [] },
                    set: { towerRun.parasites = $0 }
                ))

                // MARK: - Malfunctions (sub-view owns its sections)
                EditMalfunctionsView(malfunctions: Binding(
                    get: { towerRun.malfunctions ?? [] },
                    set: { towerRun.malfunctions = $0 }
                ))

                // MARK: - Post-Death Data
                Section {
                    NavigationLink("Combat", destination: EditCombatValuesView(combatValues: $towerRun.combat))
                    NavigationLink("Explorer", destination: EditExplorerValuesView(explorerValues: $towerRun.explorer))
                    NavigationLink("Skill", destination: EditSkillValuesView(skillValues: $towerRun.skill))
                    NavigationLink("Objectives", destination: EditObjectivesValuesView(objectiveValues: $towerRun.objectives))
                } header: {
                    ReturnalFormHeader("POST-DEATH DATA")
                }
                .listRowBackground(Color.white.opacity(0.05))

                // MARK: - Run Dates
                Section {
                    DatePicker("Started", selection: $towerRun.dateStarted)
                    DatePicker("Completed", selection: $towerRun.dateCompleted)
                } header: {
                    ReturnalFormHeader("RUN DATES")
                }
                .listRowBackground(Color.white.opacity(0.05))
            }
            .scrollContentBackground(.hidden)
            .background(Color.returnalDarkGreen)
            .fontDesign(.monospaced)
            .foregroundStyle(Color.returnalLightBlue)
            .navigationTitle("EDIT RUN")
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
                    Button("SAVE") {
                        try? modelContext.save()
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
}
