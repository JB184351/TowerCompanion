//
//  ChartsView.swift
//  TowerCompanion
//
//  Created by Justin on 6/28/24.
//

import SwiftUI
import SwiftData
import Charts

struct ChartsView: View {
    @Query private var towerRuns: [TowerRun]
    
    let scoresAndDates: [ScoresAndDates]
    
    var body: some View {
        VStack {
            Chart {
                RuleMark(y: .value("Avg Score", ChartMath.averageScore(for: towerRuns)))
                    .foregroundStyle(.returnalLightBlue).opacity(0.5)
                    .lineStyle(.init(lineWidth: 1, dash: [5]))
                
                ForEach(scoresAndDates.sorted(by: { $0.date < $1.date })) { run in
                    AreaMark(x: .value("Day", run.date, unit: .day),
                             yStart: .value("Value", run.score),
                             yEnd: .value("Min Value", ChartMath.minScore(scoresAndDates: scoresAndDates))
                    )
                    .foregroundStyle(Gradient(colors: [.returnalYellow.opacity(0.3), .clear]))
                    
                    LineMark(x: .value("Date", run.date, unit: .day), y: .value("Score", run.score))
                        .foregroundStyle(.returnalYellow)
                        .interpolationMethod(.linear)
                        .symbol(.circle)
                }
            }
            .chartYScale(domain: .automatic(includesZero: false))
            .chartXAxis {
                AxisMarks {
                    AxisValueLabel(format: .dateTime.month(.defaultDigits).day())
                }
            }
            .background(.returnalDarkGreen)
        }
        .background(.returnalDarkGreen)
    }
}

#Preview {
    ChartsView(scoresAndDates: ScoresAndDates.mockData())
}
