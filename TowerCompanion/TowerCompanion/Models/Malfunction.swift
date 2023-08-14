//
//  Malfunction.swift
//  TowerCompanion
//
//  Created by Justin on 6/12/23.
//

import Foundation

enum MalfunctionType: Codable, Hashable {
    case normal
    case permanent
}

struct Malfunction: Codable, Hashable {
    var malfunctionDescription: String
    var conditionToRemove: String
    var malfunctionType: MalfunctionType
}
