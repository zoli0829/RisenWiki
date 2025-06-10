//
//  CharacterDetailView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 10/06/2025.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Section {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(character.description)
                        .font(.body)
                }
                
                Section {
                    Text("Location:")
                        .font(.headline)
                    Text(character.location)
                        .font(.body)
                }
                
                Section {
                    Text("Quests:")
                        .font(.headline)
                    ForEach(character.relatedQuests, id: \.self) { quest in
                        Text(quest)
                            .font(.body)
                    }
                }
                
                Section {
                    Text("Tips:")
                        .font(.headline)
                    ForEach(character.tips, id: \.self) { tip in
                        Text(tip)
                            .font(.body)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Character Details")
    }
}
#Preview {
    CharacterDetailView(character: Character.example)
}
