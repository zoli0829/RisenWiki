//
//  CreaturesView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 12/06/2025.
//

import SwiftUI

struct CreaturesView: View {
    @StateObject private var viewModel = CreatureViewModel()
    
    init(viewModel: CreatureViewModel = CreatureViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredCreatures) { creature in
                    NavigationLink(destination: CreatureDetailView(creature: creature)) {
                        Text(creature.name)
                    }
                }
                .listRowBackground(
                    Capsule()
                    .fill(Color.darkParchment)
                    .padding(1)
                )
            }
            .navigationTitle("Creatures")
            .background(Color.parchment)
            .searchable(text: $viewModel.searchText, prompt: "Search for a creature")
        }
        .background(Color.parchment)
        .scrollContentBackground(.hidden) // Hides default List background
    }
}

#Preview {
    CreaturesView()
}
