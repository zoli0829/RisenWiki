//
//  RisenCharacter.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 10/06/2025.
//

import Foundation

struct Character: Codable, Identifiable {
    let name: String
    let description: String
    let location: String
    let relatedQuests: [String]
    let tips: [String]
    
    // Use `name` as unique ID
    var id: String { name }
    
    // Use fall back values if the properties are empty.
    var safeDescription: String {
        description.isEmpty ? "No description found in the wiki." : description
    }
    
    var safeLocation: String {
        location.isEmpty ? "No location data found." : location
    }
    
    var safeRelatedQuests: [String] {
        relatedQuests.isEmpty ? ["No related quests found."] : relatedQuests
    }
    
    var safeTips: [String] {
        tips.isEmpty ? ["No tips available."] : tips
    }
    
    static let example = Character(
        name: "Example Character",
        description: "This is an example character.",
        location: "Example Location",
        relatedQuests: ["Example Quest 1", "Example Quest 2"],
        tips: ["Tip 1", "Tip 2"]
    )
}
