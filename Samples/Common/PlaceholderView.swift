//
//  PlaceholderView.swift
//  Samples
//
//  Created by  Vladyslav Fil on 11.02.2023.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(.blue)
            Text("#standwithukraine")
                .foregroundColor(.yellow)
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
