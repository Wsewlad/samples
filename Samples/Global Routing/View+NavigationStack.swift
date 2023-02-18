//
//  View+NavigationStack.swift
//  Samples
//
//  Created by  Vladyslav Fil on 18.02.2023.
//

import SwiftUI

extension View {
    func embedInNavigationLink<P: Hashable>(value: P?) -> some View {
        NavigationLink(value: value, label: { self })
    }
    
    func embedInNavigationStack() -> some View {
        NavigationStack { self }
    }
    
    func embedInNavigationStack<Data>(with path: Binding<Data>) -> some View
    where
        Data : MutableCollection,
        Data : RandomAccessCollection,
        Data : RangeReplaceableCollection,
        Data.Element : Hashable
    {
        NavigationStack(path: path) { self }
    }
    
    func embedInPlainButton(action: @escaping () -> Void) -> some View {
        Button(action: action, label: { self })
            .buttonStyle(.plain)
    }
}
