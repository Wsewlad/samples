//
//  View+hideListRowSeparator.swift
//  Samples
//
//  Created by  Vladyslav Fil on 12.02.2023.
//

import SwiftUI

//MARK: - Hide List Row Separator
@available(iOS 15, *)
fileprivate struct HideListRowSeparatorModifieriOS15: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
    }
}

fileprivate struct HideListRowSeparatorModifieriOS14: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(EdgeInsets(top: -1, leading: 0, bottom: 0, trailing: 0))
            .background(Color(.systemBackground))
    }
}

extension View {
    @ViewBuilder
    func hideListRowSeparator() -> some View {
        if #available(iOS 15, *) {
            modifier(HideListRowSeparatorModifieriOS15())
        } else {
            modifier(HideListRowSeparatorModifieriOS14())
        }
    }
}
