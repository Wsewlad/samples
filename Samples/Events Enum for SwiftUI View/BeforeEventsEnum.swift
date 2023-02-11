//
//  BeforeEventsEnumSwiftUIView.swift
//  Samples
//
//  Created by  Vladyslav Fil on 11.02.2023.
//

import SwiftUI

//MARK: - Container
/// Binds data from State and sends actions to store
struct BeforeEventsEnumContainerView: View {
    var body: some View {
        NavigationStack {
            ComponentView(
                props: .init(
                    title: "Before Events Enum",
                    items: [.init(value: 1), .init(value: 2), .init(value: 3)],
                    itemById: { id in Item(id: id, title: "Item \(id.value)")},
                    removeAction: { print("Remove Item \($0.value)") },
                    approveAction: { print("Approve Item \($0.value)") },
                    cancelAction: { print("Cancel") },
                    backAction: { print("Back") },
                    navigateAction: { print("Navigate to \($0.rawValue)") }
                )
            )
        }
    }
}

//MARK: - Component
fileprivate struct ComponentView: View {
    struct Props {
        var title: String
        var items: [Item.Id]
        var itemById: (Item.Id) -> Item
        var removeAction: (Item.Id) -> Void
        var approveAction: (Item.Id) -> Void
        var cancelAction: () -> Void
        var backAction: () -> Void
        var navigateAction: (Route) -> Void
    }
    
    var props: Props
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            PlaceholderView()
            
            ForEach(props.items, id: \.self) { itemId in
                HStack {
                    Text(props.itemById(itemId).title)
                    Button("Approve") { props.approveAction(itemId) }
                    Button("Remove", role: .destructive) { props.removeAction(itemId) }
                }
            }
            
            Spacer()
            
            HStack {
                Button("Open Screen 1") { props.navigateAction(.screen1) }
                Button("Open Screen 2") { props.navigateAction(.screen2) }
            }
        }
        .buttonStyle(.bordered)
        .navigationTitle(props.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") { props.backAction() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Cancel") { props.cancelAction() }
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
struct BeforeEventsEnum_Previews: PreviewProvider {
    static var previews: some View {
        BeforeEventsEnumContainerView()
    }
}
