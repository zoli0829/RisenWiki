import Foundation

struct Quest: Codable, Identifiable {
    let name: String
    let description: String
    let location: String
    let objectives: [String]
    let reward: [String]
    let notes: [String]
    let other: [String]
    
    // Use `name` as unique ID
    var id: String { name }
    
    // Use fall back values if the properties are empty.
    var safeDescription: String {
        description.isEmpty ? "No description provided." : description
    }
    
    var safeLocation: String {
        location.isEmpty ? "No location provided." : location
    }
    
    var safeObjectives: [String] {
        objectives.isEmpty ? ["No objectives provided."] : objectives
    }
    
    var safeReward: [String] {
        reward.isEmpty ? ["No reward provided."] : reward
    }
    
    var safeNotes: [String] {
        notes.isEmpty ? [] : notes
    }
    
    var safeOther: [String] {
        other.isEmpty ? [] : other
    }
    
    // Example for preview.
    static let allQuests: [Quest] = Bundle.main.decode("LocalRisenQuests.json")
    static let example = allQuests[0]
}
