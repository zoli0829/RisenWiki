//
//  LocationsView.swift
//  RisenWiki
//
//  Created by Zoltan Vegh on 16/06/2025.
//

import SwiftUI

struct LocationsView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    init(viewModel: LocationViewModel = LocationViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.locations) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        Text(location.name)
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
            .navigationBarTitle("Locations")
        }
        .scrollContentBackground(.hidden) // Hides default List background
    }
}

#Preview {
    LocationsView()
}
