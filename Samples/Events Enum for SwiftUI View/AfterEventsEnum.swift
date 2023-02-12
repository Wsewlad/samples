//
//  AfterEventsEnumSwiftUIView.swift
//  Samples
//
//  Created by  Vladyslav Fil on 11.02.2023.
//

import SwiftUI

//MARK: - Container
/// Binds data from State and sends actions to store
@available(iOS 16.0, *)
struct AfterEventsEnumContainerView: View {
    var body: some View {
        NavigationStack {
            ComponentView(
                props: .init(
                    title: "After Events Enum",
                    items: [.init(value: 1), .init(value: 2), .init(value: 3)],
                    itemById: { id in Item(id: id, title: "Item \(id.value)")},
                    action: { perform($0) }
                )
            )
        }
    }
}

//MARK: - Events
fileprivate enum Event {
    case remove(Item.Id)
    case approve(Item.Id)
    case cancel
    case back
    case navigate(Route)
}

@available(iOS 16.0, *)
fileprivate extension AfterEventsEnumContainerView {
    func perform(_ event: Event) {
        switch event {
        case let .remove(itemId): print("Remove Item \(itemId.value)")
        case let .approve(itemId): print("Approve Item \(itemId.value)")
        case .cancel: print("Cancel")
        case .back: print("Back")
        case let .navigate(route): print("Navigate to \(route.rawValue)")
        }
    }
}

//MARK: - Component
@available(iOS 16.0, *)
fileprivate struct ComponentView: View {
    struct Props {
        var title: String
        var items: [Item.Id]
        var itemById: (Item.Id) -> Item
        var action: (Event) -> Void
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            PlaceholderView()
            
            ForEach(props.items, id: \.self) { itemId in
                HStack {
                    Text(props.itemById(itemId).title)
                    Button("Approve") { props.action(.approve(itemId)) }
                    Button("Remove", role: .destructive) { props.action(.remove(itemId)) }
                }
            }
            
            Spacer()
            
            HStack {
                Button("Open Screen 1") { props.action(.navigate(.screen1)) }
                Button("Open Screen 2") { props.action(.navigate(.screen2)) }
            }
        }
        .buttonStyle(.bordered)
        .navigationTitle(props.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") { props.action(.back) }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancel") { props.action(.cancel) }
            }
        }
    }
}

//MARK: - Helper Models
fileprivate enum Route: String {
    case screen1, screen2, screen3
}

fileprivate struct Item {
    struct Id: Hashable {
        var value: Int
    }
    
    var id: Id
    var title: String
}

//MARK: - Preview
@available(iOS 16.0, *)
struct AfterEventsEnum_Previews: PreviewProvider {
    static var previews: some View {
        AfterEventsEnumContainerView()
    }
}
