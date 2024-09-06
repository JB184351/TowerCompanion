//
//  ScoresAndCharts.swift
//  TowerCompanion
//
//  Created by Justin on 7/19/24.
//

import Foundation

struct ScoresAndDates: Identifiable {
    let id = UUID()
    let score: Int
    let date: Date
    
    static func mockData() -> [ScoresAndDates] {
        var scoresAndDates: [ScoresAndDates] = []
        let scores = randomScores(count: 10, minNumber: 10_000_000, maxNumber: 2_000_000_000)
        let dates = generateRandomDates(count: 10, startYear: 2020, endYear: 2024)
        
        for (score, date) in zip(scores, dates) {
            scoresAndDates.append(ScoresAndDates(score: score, date: date))
        }
        
        return scoresAndDates
    }
    
    static func randomScores(count: Int, minNumber: Int, maxNumber: Int) -> [Int] {
        var scores: [Int] = []
        
        for _ in 0..<count {
            let randomNumber = Int.random(in: minNumber...maxNumber)
            scores.append(randomNumber)
        }
        
        return scores
    }

    static func generateRandomDates(count: Int, startYear: Int, endYear: Int) -> [Date] {
        var dates: [Date] = []
        
        let randomDay = Int.random(in: 1...28)
        let randomMonth = Int.random(in: 1...12)
        
        let calendar = Calendar.current
        let startDateComponents = DateComponents(year: startYear, month: randomMonth, day: randomDay)
        let endDateComponents = DateComponents(year: endYear, month: randomMonth, day: randomDay)
        
        guard let startDate = calendar.date(from: startDateComponents),
              let endDate = calendar.date(from: endDateComponents) else {
            return dates
        }
        
        let timeInterval = endDate.timeIntervalSince(startDate)
        
        for _ in 0..<count {
            let randomTimeInterval = TimeInterval(arc4random_uniform(UInt32(timeInterval)))
            let randomDate = startDate.addingTimeInterval(randomTimeInterval)
            dates.append(randomDate)
        }
        
        print(dates)
        
        return dates
    }
}
