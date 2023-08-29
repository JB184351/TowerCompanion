//
//  Combat.swift
//  TowerCompanion
//
//  Created by Justin on 8/28/23.
//

import Foundation

struct Combat: Codable {
    let weakPointKills: Int
    let meleeKills: Int
    let hostilesEliminated: Int
    let malformedHostilesEliminated: Int
}
