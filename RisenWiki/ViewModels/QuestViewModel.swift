//
//  QuestViewModel.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 03/06/2025.
//

import Foundation

struct QuestsResponse: Codable {
    let quests: [Quest]
}

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = []
    @Published var searchText: String = ""
    
    // Searchable filter.
    var filteredQuests: [Quest] {
        if searchText.isEmpty {
            return quests
        } else {
            return quests.filter { $0.name.localizedStandardContains(searchText)}
        }
    }
    
    init() {
            Task {
                await loadQuests()
            }
        }
    
    func loadQuests() async {
        guard let url = URL(string: APIKey().risenQuestsKey) else {
            print("Invalid URL")
            loadFromLocalFile()
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(QuestsResponse.self, from: data) {
                await MainActor.run {
                    self.quests = decodedResponse.quests
                }
            } else {
                print("Failed to decode API response - loading local JSON")
                loadFromLocalFile()
            }
        } catch {
            print("Fetch error: \(error.localizedDescription) — loading local JSON")
            loadFromLocalFile()
        }
    }
    
    func loadFromLocalFile() {
            let localQuests: QuestsResponse = Bundle.main.decode("LocalRisenQuests.json")
            DispatchQueue.main.async {
                self.quests = localQuests.quests
            }
        }
}

// Mock for preview purpuses, #if debug to make sure mocks arent included in production builds
#if DEBUG
class MockQuestViewModel: QuestViewModel {
    override init() {
        super.init()
        quests = [
            Quest(
                name: "Mock Quest 1",
                description: "Description of Mock Quest 1",
                location: "Mock Location",
                objectives: ["Objective 1", "Objective 2"],
                reward: ["100 XP"],
                notes: [],
                other: []
            ),
            Quest(
                name: "Mock Quest 2",
                description: "Description of Mock Quest 2",
                location: "Another Location",
                objectives: [],
                reward: ["200 XP", "50 Gold"],
                notes: [],
                other: []
            )
        ]
    }
}
#endif
