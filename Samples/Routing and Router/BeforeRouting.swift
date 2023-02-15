//
//  BeforeRouting.swift
//  Samples
//
//  Created by  Vladyslav Fil on 13.02.2023.
//

import SwiftUI

struct RootViewBeforeRouting<
    Calendar: View,
    Stats: View,
    Chat: View,
    Favorites: View
>: View {
    var calendar: (Date) -> Calendar
    var stats: () -> Stats
    var chat: () -> Chat
    var favorites: () -> Favorites
    
    var body: some View {
        TabView {
            calendar(Date())
                .tabItem { Label("Calendar", systemImage: "calendar") }
            
            stats()
                .tabItem { Label("Stats", systemImage: "chart.bar.fill") }
            
            chat()
                .tabItem { Label("Chat", systemImage: "bubble.left.and.bubble.right") }
            
            favorites()
                .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
        .foregroundColor(.secondary)
        .font(.largeTitle)
    }
}

struct RootViewBeforeRouting_Previews: PreviewProvider {
    static var previews: some View {
        RootViewBeforeRouting<CalendarView, StatsView, ChatView, FavoritesView>(
            calendar: { CalendarView(currentDate: $0) },
            stats: { StatsView() },
            chat: { ChatView() },
            favorites: { FavoritesView() }
        )
    }
}

//MARK: - Views
struct CalendarView: View {
    var currentDate: Date
    
    var body: some View {
        VStack {
            Label("Calendar", systemImage: "calendar")
            Text(currentDate.ISO8601Format())
                .font(.title)
                .bold()
        }
        .foregroundColor(.secondary)
        .font(.largeTitle)
    }
}

struct StatsView: View {
    var body: some View {
        Label("Stats", systemImage: "chart.bar.fill")
            .foregroundColor(.secondary)
            .font(.largeTitle)
    }
}

struct ChatView: View {
    var body: some View {
        Label("Chat", systemImage: "bubble.left.and.bubble.right")
            .foregroundColor(.secondary)
            .font(.largeTitle)
    }
}

struct FavoritesView: View {
    var body: some View {
        Label("Favorites", systemImage: "star.fill")
            .foregroundColor(.secondary)
            .font(.largeTitle)
        }
}
