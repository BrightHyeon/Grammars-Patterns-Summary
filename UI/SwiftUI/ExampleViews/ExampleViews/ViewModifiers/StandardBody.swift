//
//  StandardBody.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/25.
//

import SwiftUI

struct StandardBody: ViewModifier {
    func body(content: Content) -> some View { //ViewModifier의 body함수도 @ViewBuilder로 되어있음.
        content
            .font(.body)
            .foregroundColor(.mint)
    }
}

