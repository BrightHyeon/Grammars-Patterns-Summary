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
            
            Spacer()
            
            MyVStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Text("Hello, World!")
                    .fontWeight(.light)
            }
            
            Spacer()
            
            MyHStack2 {
                Text("hi")
                Text("hello")
            }
            
            MyHStack3 {
                Text("hi")
                Text("hello")
            }
            
            Spacer()
            
            HStack {
                AView()
                BView()
                CView()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
