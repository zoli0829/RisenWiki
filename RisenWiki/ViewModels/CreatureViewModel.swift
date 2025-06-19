//
//  CreatureViewModel.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 12/06/2025.
//

import Foundation

struct CreatureResponse: Decodable {
    let creatures: [Creature]
}

class CreatureViewModel: ObservableObject {
    @Published var creatures: [Creature] = []
    @Published var searchText: String = ""
    
    var filteredCreatures: [Creature] {
        if searchText.isEmpty {
            return creatures
        } else {
            return creatures.filter {$0.name.localizedStandardContains(searchText)}
        }
    }
    
    init() {
        Task {
            await loadCreatures()
        }
    }
    
    func loadCreatures() async {
        guard let url = URL(string: APIKey().risenCreatureskey) else {
            print("Invalid URL and load from file")
            loadFromLocalFile()
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(CreatureResponse.self, from: data) {
                await MainActor.run {
                    self.creatures = decodedResponse.creatures
                }
            } else {
                print("Failed to decode API response - loading local Creatures JSON")
                loadFromLocalFile()
            }
        } catch {
            print("Fetch error: \(error.localizedDescription) - loading local Creatures JSON")
            loadFromLocalFile()
        }
    }
    
    func loadFromLocalFile() {
        let localCreatures: CreatureResponse = Bundle.main.decode("LocalRisenCreatures.json")
        DispatchQueue.main.async {
            self.creatures = localCreatures.creatures
        }
    }
}

// Mock for preview purposes.
#if DEBUG
class MockCreatureViewModel: CreatureViewModel {
    override init() {
        super.init()
        creatures = [
            Creature(name: "Mock Creature", description: "Mock description", location: "Mock location", encounters: "", tactics: [], statistics: [], rewards: []),
            Creature(name: "Mock Creature2", description: "Mock description2", location: "Mock location2", encounters: "", tactics: [], statistics: [], rewards: [])
        ]
    }
}
#endif
