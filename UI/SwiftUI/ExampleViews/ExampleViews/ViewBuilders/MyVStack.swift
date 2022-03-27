//
//  MyVStack.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/25.
//

import SwiftUI

struct MyVStack<Content: View>: View { //generic Content : View 프로토콜을 따르는 어떤 것이든 Content이다.
    
    let content: () -> Content //Content를 반환하는 클로저변수를 선언.
    
    init(@ViewBuilder content: @escaping () -> Content) { //초기화하는 단계에서 Content를 반환하는 클로저아이템을 받아서 할당.
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 20) {
            content() //들어온 애를 이 body형식에 맞춰서 ViewBuild~!!!
        }
        .font(.largeTitle)
    }
}
