//
//  ChartMath.swift
//  TowerCompanion
//
//  Created by Justin on 7/12/24.
//

import Foundation

struct ChartMath {
    
    static func averageScore(for runs: [TowerRun]) -> Int {
        return (runs.reduce(0) { $0 + $1.score }) / runs.count
    }
    
    static func minScore(for runs: [TowerRun]) -> Int {
        return runs.map { $0.score }.min() ?? 0
    }
    
    static func minScore(scoresAndDates: [ScoresAndDates]) -> Int {
        return scoresAndDates.map { $0.score }.min() ?? 0
    }
}
