//
//  ContentView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedGame = "Game 1"
    
    let games = ["Game 1", "Game 2", "Game 3"]
    
    var body: some View {
        NavigationStack {
            // Buttons at the bottom of the screen
            TabView {
                QuestsView()
                    .tabItem {
                        Label("Quests", systemImage: "list.bullet")
                    }
                
                Text("CharactersView")
                //CharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "person.3")
                    }
                
                Text("CreaturesView")
                //CreaturesView()
                    .tabItem {
                        Label("Creatures", systemImage: "tortoise.fill")
                    }
                
                Text("LocationsView")
                //LocationsView()
                    .tabItem {
                        Label("Locations", systemImage: "map.fill")
                    }
                
                Text("ItemsView")
                //ItemsView()
                    .tabItem {
                        Label("Items", systemImage: "bag.fill")
                    }
                
                Text("MechanicsView")
                //MechanicsView()
                    .tabItem {
                        Label("Mechanics", systemImage: "gearshape.fill")
                    }
            }
            .navigationTitle(selectedGame)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Home button action here
                    } label: {
                        Label("Home", systemImage: "house.fill")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        ForEach(games, id: \.self) { game in
                            Button(game) {
                                selectedGame = game
                            }
                        }
                    } label: {
                        Label("Select Game", systemImage: "gamecontroller.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
