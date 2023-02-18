//
//  RootViewWithGlobalRouting+Extensions.swift
//  Samples
//
//  Created by  Vladyslav Fil on 18.02.2023.
//

import SwiftUI

struct RootViewWithGlobalRoutingWithExtensions: View {
    // Can be located in your ViewModel (MVVM) or State (Redux)
    @State private var path: [GlobalRouting] = []
    
    var body: some View {
        List {
            // Use NavigationLink to navigate
            Label("Calendar", systemImage: "calendar")
                .embedInNavigationLink(value: GlobalRouting.root(.calendar(current: Date())))
            Label("Stats", systemImage: "chart.bar.fill")
                .embedInNavigationLink(value: GlobalRouting.root(.stats))
            
            // Or just append new element to `path`
            Label("Chat", systemImage: "bubble.left.and.bubble.right")
                .embedInPlainButton { path.forward(to: .root(.chat)) }
            Label("Favorites", systemImage: "star.fill")
                .embedInPlainButton { path.forward(to: .root(.favorites)) }
        }
        .foregroundColor(.secondary)
        .font(.largeTitle)
        .navigationTitle("Global Routing")
        .globalNavigationDestination()
        .embedInNavigationStack(with: $path)
    }
}

struct RootViewWithGlobalRoutingWithExtensions_Previews: PreviewProvider {
    static var previews: some View {
        RootViewWithGlobalRoutingWithExtensions()
    }
}
