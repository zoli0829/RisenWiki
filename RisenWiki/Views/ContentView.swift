//
//  ContentView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 02/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                QuestsView()
            }
            .tabItem {
                Label("Quests", systemImage: "list.bullet")
            }
            
            NavigationStack {
                CharactersView()
            }
            .tabItem {
                Label("Characters", systemImage: "person.3")
            }
            
            NavigationStack {
                CreaturesView()
            }
            .tabItem {
                Label("Creatures", systemImage: "tortoise.fill")
            }
            
            NavigationStack {
                LocationsView()
            }
            .tabItem {
                Label("Locations", systemImage: "map.fill")
            }
        }
        .navigationTitle("RisenWiki")
        .background(Color.parchment)
    }
}

#Preview {
    ContentView()
}
