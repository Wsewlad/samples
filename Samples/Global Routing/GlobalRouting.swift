//
//  GlobalRouting.swift
//  Samples
//
//  Created by  Vladyslav Fil on 15.02.2023.
//

import SwiftUI

enum GlobalRouting: Equatable, Hashable {
    case root(RootRouting.Route)
//    сase calendar(CalendarRouting.Route)
//    сase stats(StatsRouting.Route)
//    сase chat(ChatRouting.Route)
//    сase favorites(FavoritesRouting.Route)
}

extension View {
    func globalNavigationDestination() -> some View {
        self
            .navigationDestination(
                for: GlobalRouting.self,
                destination: { routing in
                    switch routing {
                    case let .root(route):
                        Router<RootRouting>().view(for: route)
//                    case let .calendar(route):
//                        Router<CalendarRouting>().view(for: route)
//                    case let .stats(route):
//                        Router<StatsRouting>().view(for: route)
//                    case let .chatv(route):
//                        Router<ChatRouting>().view(for: route)
//                    case let .favorites(route):
//                        Router<FavoritesRouting>().view(for: route)
                    }
                }
            )
    }
}
