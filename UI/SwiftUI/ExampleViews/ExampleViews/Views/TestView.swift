//
//  TestView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/25.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .modifier(StandardTitle())
                Text("Hello, World!")
                    .fontWeight(.light)
                    .modifier(StandardBody())
            }
            
            MyVStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Text("Hello, World!")
                    .fontWeight(.light)
            }
            
            MyHStack2 {
                Text("hi")
                Text("hello")
            }
            
            MyHStack3 {
                Text("hi")
                Text("hello")
            }
            
            HStack {
                AView()
                    .layoutPriority(1)
                BView() //layoutPriority default값은 0이다.
                CView()
                    .layoutPriority(1)
            }
            .lineLimit(1)
            
            Text("hello, world")
                .font(.caption)
            //사용가능한, 여분의 여백의 모든 영역을 차지하는 frame구성법.
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity,
                       alignment: .center)
                .border(.black, width: 5)
                //frame은 기본적으로 safeArea를 준수함.
//                .edgesIgnoringSafeArea(.all) //safeArea무시하게하는 코드.
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
