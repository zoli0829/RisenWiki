//
//  QuestDetailView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 03/06/2025.
//

import SwiftUI

struct QuestDetailView: View {
    let quest: Quest
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.parchment
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    Section {
                        Text(quest.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(quest.safeDescription)
                            .font(.body)
                    }
                    
                    Section {
                        Text("Location:")
                            .font(.headline)
                        Text(quest.safeLocation)
                    }
                    
                    Section {
                        Text("Objectives:")
                            .font(.headline)
                        ForEach(quest.safeObjectives, id: \.self) { objective in
                            Text("• \(objective)")
                        }
                    }
                    
                    Section {
                        Text("Rewards:")
                            .font(.headline)
                        ForEach(quest.safeReward, id: \.self) { rewardItem in
                            Text("- \(rewardItem)")
                        }
                    }
                    
                    Section {
                        Text("Notes:")
                            .font(.headline)
                        ForEach(quest.safeNotes, id: \.self) { note in
                            Text("- \(note)")
                        }
                        
                        Text("Other:")
                            .font(.headline)
                        ForEach(quest.safeOther, id: \.self) { item in
                            Text("- \(item)")
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Quest Details")
        .background(Color.parchment)
    }
}

#Preview {
    QuestDetailView(quest: Quest.example)
}
