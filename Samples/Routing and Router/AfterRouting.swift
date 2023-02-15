//
//  AfterRouting.swift
//  Samples
//
//  Created by  Vladyslav Fil on 13.02.2023.
//

import SwiftUI

struct RootRouting: Routing {
    enum Route: Equatable, Hashable {
        case calendar(current: Date)
        case stats
        case chat
        case favorites
    }
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case let .calendar(currentDate): CalendarView(currentDate: currentDate)
        case .stats: StatsView()
        case .chat: ChatView()
        case .favorites: FavoritesView()
        }
    }
}

struct RootViewAfterRouting: View {
    var router: Router<RootRouting> = .init()
    
    var body: some View {
        TabView {
            router.view(for: .calendar(current: Date()))
                .tabItem { Label("Calendar", systemImage: "calendar") }
            
            router.view(for: .stats)
                .tabItem { Label("Stats", systemImage: "chart.bar.fill") }
            
            router.view(for: .chat)
                .tabItem { Label("Chat", systemImage: "bubble.left.and.bubble.right") }
            
            router.view(for: .favorites)
                .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
        .foregroundColor(.secondary)
        .font(.largeTitle)
    }
}

struct RootViewAfterRouting_Previews: PreviewProvider {
    static var previews: some View {
        RootViewAfterRouting()
    }
}
