//
//  Creature.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 12/06/2025.
//

import Foundation

struct Creature: Codable, Identifiable, Hashable {
    let name: String
    let description: String
    let location: String
    let encounters: String
    let tactics: [String]
    let statistics: [String]
    let rewards: [String]
    
    // Use `name` as unique ID
    var id: String { name }
    
    // Fall back values.
    var safeDescription: String {
        description.isEmpty ? "No description available." : description
    }
    
    var safeLocation: String {
        location.isEmpty ? "No location available." : location
    }
    
    var safeEncounters: String {
        encounters.isEmpty ? "No encounters available." : encounters
    }
    
    var safeTactics: [String] {
        tactics.isEmpty ? ["No tactics available."] : tactics
    }
    
    var safeStatistics: [String] {
        statistics.isEmpty ? ["No statistics available."] : statistics
    }
    
    var safeRewards: [String] {
        rewards.isEmpty ? ["No rewards available."] : rewards
    }
    
    // Example for preview.
    static let allCreatures: [Creature] = Bundle.main.decode("LocalRisenCreatures.json")
    static let example = allCreatures[0]
}
