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
            VStack(alignment: .leading, spacing: 16) {
                Text(quest.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(quest.description)
                    .font(.body)
                
                Text("📍 Location:")
                    .font(.headline)
                Text(quest.location)
                
                if !quest.objectives.isEmpty {
                    Text("🎯 Objectives:")
                        .font(.headline)
                    ForEach(quest.objectives, id: \.self) { objective in
                        Text("• \(objective)")
                    }
                }
                
                if !quest.reward.isEmpty {
                    Text("🏆 Rewards:")
                        .font(.headline)
                    ForEach(quest.reward, id: \.self) { rewardItem in
                        Text("- \(rewardItem)")
                    }
                }
                
                if !quest.notes.isEmpty {
                    Text("📝 Notes:")
                        .font(.headline)
                    ForEach(quest.notes, id: \.self) { note in
                        Text("- \(note)")
                    }
                }
                
                if !quest.other.isEmpty {
                    Text("📌 Other:")
                        .font(.headline)
                    ForEach(quest.other, id: \.self) { item in
                        Text("- \(item)")
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Quest Details")
    }
}

#Preview {
    QuestDetailView(quest: Quest.example)
}
