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
    
    static let example = Quest(name: "Test Quest Name", description: "Test Quest Description", location: "Test Location", objectives: ["Test Objective 1", "Test Objective 2"], reward: ["Test Gold", "Test XP"], notes: [], other: [])
}
