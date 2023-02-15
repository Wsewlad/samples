//
//  RootViewWithGlobalRouting.swift
//  Samples
//
//  Created by  Vladyslav Fil on 15.02.2023.
//

import SwiftUI

struct RootViewWithGlobalRouting: View {
    // Can be located in your ViewModel (MVVM) or State (Redux)
    @State private var path: [GlobalRouting] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                // Use NavigationLink to navigate
                NavigationLink(
                    value: GlobalRouting.root(.calendar(current: Date()))
                ) { Label("Calendar", systemImage: "calendar") }
                
                NavigationLink(
                    value: GlobalRouting.root(.stats)
                ) { Label("Stats", systemImage: "chart.bar.fill") }
                
                
                // Or just append new element to `path`
                Button { path.append(.root(.chat)) }
                label: { Label("Chat", systemImage: "bubble.left.and.bubble.right") }
                
                Button { path.append(.root(.favorites)) }
                label: { Label("Favorites", systemImage: "star.fill") }
            }
            .foregroundColor(.secondary)
            .font(.largeTitle)
            .navigationTitle("Global Routing")
            .globalNavigationDestination()
        }
    }
}

struct RootViewWithGlobalRouting_Previews: PreviewProvider {
    static var previews: some View {
        RootViewWithGlobalRouting()
    }
}
