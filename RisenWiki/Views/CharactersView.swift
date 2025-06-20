//
//  CharactersView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 10/06/2025.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    init(viewModel: CharacterViewModel = CharacterViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredCharacters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        Text(character.name)
                            .listRowBackground(Color.parchment)
                    }
                }
                .listRowBackground(
                    Capsule()
                    .fill(Color.darkParchment)
                    .padding(1)
                )
            }
            .background(Color.parchment)
            .navigationTitle("Characters")
            .searchable(text: $viewModel.searchText, prompt: "Search for a character")
        }
        .scrollContentBackground(.hidden) // Hides default List background
    }
}

#Preview {
    CharactersView()
}
