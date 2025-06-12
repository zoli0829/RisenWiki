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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CreaturesView()
}
