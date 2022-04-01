//
//  DrawDemo.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/01.
//

import SwiftUI

struct DrawDemoView: View {
    var body: some View {
        VStack {
            
            //이들 Shape프로토콜의 요소들은 자기가 차지할 수 잇는 최대한을 차지한다!.
            //그러니 조절하려면 frame을 적용해줘야함!!!
            
            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
            
            
            Rectangle()
            
            
            RoundedRectangle(cornerRadius: 20)
            
            
            Capsule()
            
        }
    }
}

struct DrawDemo_Previews: PreviewProvider {
    static var previews: some View {
        DrawDemoView()
    }
}
