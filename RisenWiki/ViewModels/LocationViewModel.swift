//
//  LocationViewModel.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 16/06/2025.
//

import Foundation

struct LocationResponse: Codable {
    let locations: [Location]
}

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    init() {
        Task {
            await loadLocations()
        }
    }
    
    func loadLocations() async {
        guard let url = URL(string: APIKey().risenLocationsKey) else {
            print("Invalid URL")
            loadFromLocalFile()
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(LocationResponse.self, from: data) {
                await MainActor.run {
                    self.locations = decodedResponse.locations
                }
            } else {
                print("Failed to decode API response - loading local Locations JSON")
                loadFromLocalFile()
            }
        } catch {
            print("Fetch error: \(error.localizedDescription) — loading local Locations JSON")
            loadFromLocalFile()
        }
    }
        
    func loadFromLocalFile() {
        let localLocations: LocationResponse = Bundle.main.decode("LocalRisenLocations.json")
        DispatchQueue.main.async {
            self.locations = localLocations.locations
        }
    }
}

// Mock for preview purpuses, #if debug to make sure mocks arent included in production builds
#if DEBUG
class MockLocationViewModel: LocationViewModel {
    override init() {
        super.init()
        locations = [
            Location(
                name: "Mock Location 1",
                description: "Description of Mock Location 1",
            ),
            Location(
                name: "Mock Location 2",
                description: "Description of Mock Location 2",
            )
        ]
    }
}
#endif
