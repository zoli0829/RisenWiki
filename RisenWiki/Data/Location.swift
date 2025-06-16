//
//  Locations.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 16/06/2025.
//

import Foundation

struct Location: Codable, Identifiable {
    let name: String
    let description: String
    
    // Use `name` as unique ID
    var id: String { name }
    
    // Fall back values.
    var safeDescription: String {
        description.isEmpty ? "No description available." : description
    }
    
    // Example for preview.
    static let allLocations: [Location] = Bundle.main.decode("LocalRisenLocations.json")
    static let example = allLocations[0]
}
