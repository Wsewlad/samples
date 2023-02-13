//
//  Routing.swift
//  Samples
//
//  Created by  Vladyslav Fil on 13.02.2023.
//

import SwiftUI

//MARK: - Initable
protocol Initable {
    init()
}

//MARK: - Routing
protocol Routing<Route>: Initable {
    associatedtype Route
    associatedtype Destination : View

    func view(for route: Route) -> Destination
}

//MARK: - Router
final class Router<R> where R : Routing {
    final var routing: R

    init(routing: R) {
        self.routing = routing
    }
    
    init() {
        self.routing = .init()
    }

    final func view(for route: R.Route) -> some View {
        routing.view(for: route)
    }
}
