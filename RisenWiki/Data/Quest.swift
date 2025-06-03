struct Quest: Codable {
	let name: String
	let description: String
	let location: String
	let objectives: [String]
	let reward: [String]
	let notes: [String]
	let other: [String]
}