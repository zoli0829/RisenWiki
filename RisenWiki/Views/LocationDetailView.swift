//
//  LocationDetailView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 16/06/2025.
//

import SwiftUI

struct LocationDetailView: View {
    let location: Location
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.parchment
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    Section {
                        Text(location.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(location.safeDescription)
                            .font(.body)
                    }
                }
                .padding()
            }
        }
        .background(Color.parchment)
    }
}

#Preview {
    LocationDetailView(location: Location.example)
}
