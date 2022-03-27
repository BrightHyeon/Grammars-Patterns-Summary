//
//  StandardTitle.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/25.
//

import SwiftUI

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(.white)
            .border(.gray, width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

