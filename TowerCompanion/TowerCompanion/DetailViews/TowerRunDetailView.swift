//
//  TowerRunDetailView.swift
//  TowerCompanion
//

import SwiftUI

struct TowerRunDetailView: View {

    @Bindable var towerRun: TowerRun
    @State private var isEditViewPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                runHeader
                scorePanel

                ReturnalSectionHeader(title: "WEAPON")
                WeaponDetailView(weapon: towerRun.weapon)

                ReturnalSectionHeader(title: "SUIT STATS")
                StatsDetailView(stats: towerRun.stats)

                if let artifacts = towerRun.artifacts, !artifacts.isEmpty {
                    ReturnalSectionHeader(title: "ARTIFACTS")
                    ArtifactsDetailView(artifacts: artifacts)
                }

                if let parasites = towerRun.parasites, !parasites.isEmpty {
                    ReturnalSectionHeader(title: "PARASITES")
                    ParasitesDetailView(parasites: parasites)
                }

                if let malfunctions = towerRun.malfunctions, !malfunctions.isEmpty {
                    ReturnalSectionHeader(title: "MALFUNCTIONS")
                    MalfunctionsDetailView(malfunctions: malfunctions)
                }

                if towerRun.combat != nil || towerRun.explorer != nil || towerRun.skill != nil || towerRun.objectives != nil {
                    ReturnalSectionHeader(title: "POST-DEATH DATA")

                    if let combat = towerRun.combat {
                        CombatDetailView(combat: combat)
                    }
                    if let explorer = towerRun.explorer {
                        ExplorerDetailsView(explorer: explorer)
                    }
                    if let skill = towerRun.skill {
                        SkillDetailView(skill: skill)
                    }
                    if let objectives = towerRun.objectives {
                        ObjectivesDetailView(objectives: objectives)
                    }
                }

                Spacer(minLength: 40)
            }
        }
        .background(Color.returnalDarkGreen)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    isEditViewPresented = true
                }
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundStyle(Color.returnalYellow)
            }

            ToolbarItem(placement: .topBarTrailing) {
                let runText = CreateText.createText(for: towerRun)
                if let url = CreateText.createTextFile(withContent: runText, fileName: "run.txt") {
                    ShareLink(item: url, preview: SharePreview("Tower Run"))
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundStyle(Color.returnalYellow)
                }
            }
        }
        .sheet(isPresented: $isEditViewPresented) {
            EditRunView(towerRun: towerRun)
        }
    }

    // MARK: - Run Header

    private var runHeader: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(towerRun.scoutName.isEmpty ? "UNKNOWN SCOUT" : towerRun.scoutName.uppercased())
                .font(.system(size: 22, weight: .heavy, design: .monospaced))
                .foregroundStyle(Color.returnalYellow)

            HStack(spacing: 10) {
                platformBadge
                Text(towerRun.dateCompleted.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue.opacity(0.6))
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 16)
    }

    private var platformBadge: some View {
        Text(towerRun.platform)
            .font(.system(size: 10, weight: .heavy, design: .monospaced))
            .kerning(1)
            .foregroundStyle(Color.returnalDarkGreen)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(Color.returnalLightBlue)
            .clipShape(RoundedRectangle(cornerRadius: 2))
    }

    // MARK: - Score Panel

    private var scorePanel: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.returnalYellow.opacity(0.3))
                .padding(.horizontal, 16)

            VStack(spacing: 4) {
                Text("FINAL SCORE")
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue.opacity(0.6))
                    .kerning(4)
                    .padding(.top, 16)

                Text(towerRun.score.formatted())
                    .font(.system(size: 46, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Color.returnalYellow)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)

            HStack(spacing: 0) {
                multiplierCell(label: "AVG", value: towerRun.averageMultiplier)
                Rectangle()
                    .frame(width: 1)
                    .foregroundStyle(Color.returnalLightBlue.opacity(0.15))
                    .padding(.vertical, 8)
                multiplierCell(label: "HIGH", value: towerRun.highestMultiplier)
                Rectangle()
                    .frame(width: 1)
                    .foregroundStyle(Color.returnalLightBlue.opacity(0.15))
                    .padding(.vertical, 8)
                multiplierCell(label: "FINAL", value: towerRun.finalMultiplier)
            }
            .overlay(
                Rectangle()
                    .strokeBorder(Color.returnalLightBlue.opacity(0.15), lineWidth: 1)
            )
            .padding(.horizontal, 16)
            .padding(.top, 14)

            HStack(spacing: 6) {
                Text("PHASE \(towerRun.phase)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue)
                Text("·")
                    .foregroundStyle(Color.returnalLightBlue.opacity(0.4))
                Text("ROOM \(towerRun.room)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.returnalLightBlue)
            }
            .padding(.top, 12)
            .padding(.bottom, 16)

            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.returnalYellow.opacity(0.3))
                .padding(.horizontal, 16)
        }
    }

    private func multiplierCell(label: String, value: Double) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundStyle(Color.returnalLightBlue.opacity(0.5))
                .kerning(2)
            Text(String(format: "×%.1f", value))
                .font(.system(size: 20, weight: .heavy, design: .monospaced))
                .foregroundStyle(Color.returnalLightBlue)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
    }
}

// MARK: - Section Header

struct ReturnalSectionHeader: View {
    let title: String

    var body: some View {
        HStack(spacing: 8) {
            Text("◈")
                .font(.caption)
                .foregroundStyle(Color.returnalYellow)
            Text(title)
                .font(.system(size: 10, weight: .heavy, design: .monospaced))
                .foregroundStyle(Color.returnalYellow)
                .kerning(3)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.returnalYellow.opacity(0.25))
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        .padding(.bottom, 10)
    }
}
