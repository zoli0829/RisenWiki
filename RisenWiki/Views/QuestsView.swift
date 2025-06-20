//
//  QuestsView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 03/06/2025.
//

import SwiftUI

struct QuestsView: View {
    @StateObject private var viewModel = QuestViewModel()
    
    init(viewModel: QuestViewModel = QuestViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredQuests) { quest in
                    NavigationLink(destination: QuestDetailView(quest: quest)) {
                        Text(quest.name)
                    }
                }
                .listRowBackground(
                    Capsule()
                    .fill(Color.darkParchment)
                    .padding(1)
                )
            }
            .background(Color.parchment)
            .navigationTitle("Quests")
            .searchable(text: $viewModel.searchText, prompt: "Search for a quest")
        }
        .scrollContentBackground(.hidden) // Hides default List background
    }
}

#Preview {
    QuestsView(viewModel: MockQuestViewModel())
}
