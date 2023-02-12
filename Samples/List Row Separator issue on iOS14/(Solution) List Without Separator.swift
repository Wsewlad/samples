//
//  (Solution) List Without Separator.swift
//  Samples
//
//  Created by  Vladyslav Fil on 12.02.2023.
//

import SwiftUI

struct ListWithoutSeparatorSolutionView: View {
    var screenBackground = Color.blue.opacity(0.5)
    var listItemsBackground = Color.yellow.opacity(0.5)
    var itemBackground = Color.white.opacity(0.8)
    
    var body: some View {
        List {
            ForEach(0..<10, id: \.self) { item in
                Text("Item \(item)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        itemBackground
                            .cornerRadius(8)
                    )
                    .padding([.horizontal, .bottom], 16)
                // Your List's Items background.
//                    .background(listItemsBackground)
                // Use
                    .background(screenBackground)
                // for consistency
                    .hideListRowSeparator()
            }
        }
        // Your screen's background
        .background(screenBackground.ignoresSafeArea(.all))
        .onAppear {
            // Doesn't work
            UITableView.appearance().separatorStyle = .none
            
            // Should use to make List's background clear and allow showing your screen's background
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct ListWithoutSeparatorSolutionView_Previews: PreviewProvider {
    static var previews: some View {
        ListWithoutSeparatorSolutionView()
    }
}
