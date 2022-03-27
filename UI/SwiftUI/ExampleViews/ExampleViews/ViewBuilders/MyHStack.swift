//
//  MyHStack.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import SwiftUI

struct MyHStack<Content>: View where Content: View {
    
    let content: () -> Content
    let color: Color
    
    init(color: Color = .clear,
         @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.content = content
    }
    
    var body: some View {
        HStack {
            content()
        }
        .background(color)
    }
}


//만약 Swift 5.4이상을 사용하고, 딱히 생성자가 필요없으면 이렇게도 가능~!.
struct MyHStack2<Content>: View where Content : View {
    
    @ViewBuilder let content: Content
    
    var body: some View {
        HStack(spacing: 70) {
            content
        }
        .background(Color.purple)
    }
}

struct MyHStack3<Content>: View where Content : View {
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        HStack(spacing: 70) {
            content()
        }
        .background(Color.green)
    }
}


//custom한거 하나 만들어보자.
//
