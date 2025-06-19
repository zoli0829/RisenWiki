//
//  RisenCharacterViewModel.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 10/06/2025.
//

import Foundation

struct CharacterResponse: Codable {
    let characters: [Character]
}

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var searchText: String = ""
    
    // Searchable filter.
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    init() {
        Task {
            await loadCharacters()
        }
    }
    
    func loadCharacters() async {
        guard let url = URL(string: APIKey().risenCharactersKey) else {
            print("Invalid URL and load from file")
            loadFromLocalFile()
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(CharacterResponse.self, from: data) {
                await MainActor.run {
                    self.characters = decodedResponse.characters
                }
            } else {
                print("Failed to decode API response - loading local Character JSON")
                loadFromLocalFile()
            }
        } catch {
            print("Fetch error: \(error.localizedDescription) - loading local Character JSON")
            loadFromLocalFile()
        }
    }
    
    func loadFromLocalFile() {
        let localCharacters: CharacterResponse = Bundle.main.decode("LocalRisenCharacters.json")
        DispatchQueue.main.async {
            self.characters = localCharacters.characters
        }
    }
}

// Mock for preview purposes.
#if DEBUG
class MockCharacterViewModel: CharacterViewModel {
    override init() {
        super.init()
        characters = [
            Character(name: "Mock Character 1", description: "Mock Description", location: "Mock location", relatedQuests: [], tips: []),
            Character(name: "Mock Character 2", description: "Mock Description 2", location: "Mock location 2", relatedQuests: [], tips: []),
        ]
    }
}
#endif
