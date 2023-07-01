//
//  Malfunction.swift
//  TowerCompanion
//
//  Created by Justin on 6/12/23.
//

import Foundation

enum MalfunctionType: Codable {
    case normal
    case permanent
}

struct Malfunction: Codable {
    var malfunctionDescription: String
    var conditionToRemove: String
    var type: MalfunctionType
}
