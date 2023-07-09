//
//  Malfunction.swift
//  TowerCompanion
//
//  Created by Justin on 6/12/23.
//

import Foundation

// Adding Enum type on Object works with Xcode 15 beta 3
// Wait until Beta 4 or whenever Live Previews are working
// with SwiftData before adding this property to the Malfunction Type
enum MalfunctionType: Codable, Hashable {
    case normal
    case permanent
}

struct Malfunction: Codable, Hashable {
    var malfunctionDescription: String
    var conditionToRemove: String
}
