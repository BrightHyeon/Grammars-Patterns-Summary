//
//  CustomTransition.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

extension AnyTransition {
    static var allTranstionCombined: AnyTransition {
        AnyTransition.asymmetric(insertion: AnyTransition.opacity.combined(with: move(edge: .top).combined(with: .slide).combined(with: .scale)),
                                 removal: AnyTransition.move(edge: .bottom).combined(with: .opacity))
    }
}
