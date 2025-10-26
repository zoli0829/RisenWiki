//
//  CreatureDetailView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 13/06/2025.
//

import SwiftUI

struct CreatureDetailView: View {
    let creature: Creature
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.parchment
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    Section {
                        Text(creature.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(creature.safeDescription)
                            .font(.body)
                    }
                    
                    Section {
                        Text("Location:")
                            .font(.headline)
                        Text(creature.safeLocation)
                    }
                    
                    Section {
                        Text("Tactics:")
                            .font(.headline)
                        ForEach(creature.safeTactics, id: \.self) { tactic in
                            Text("• \(tactic)")
                        }
                    }
                    
                    Section {
                        Text("Statistics:")
                            .font(.headline)
                        ForEach(creature.safeStatistics, id: \.self) { statistic in
                            Text("- \(statistic)")
                        }
                    }
                    
                    Section {
                        Text("Encounters:")
                            .font(.headline)
                        Text(creature.safeEncounters)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Creature Details")
        .background(Color.parchment)
    }
}

#Preview {
    CreatureDetailView(creature: Creature.example)
}
