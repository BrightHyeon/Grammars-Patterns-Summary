//
//  ContentView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 2
    
    var body: some View {
        TabView(selection: $selection) {
            Color.black
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("추천")
                }
                .tag(0)
            Color.gray
//                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("추천")
                }
                .tag(1)
            Color.white
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("추천")
                }
                .tag(2)
        }
        .accentColor(.black) //will deprecated.
//        .tabViewStyle(.page) //대박! UIKit의 PageViewController를 어느정도 대체할 수 있겠는데? = .tabViewStyle(PageTabViewStyle())도 같은 표현이다.
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor.lightGray
        } //MARK: safeArea를 무시해도, 아래 탭바의 백컬러는 고정되도록 한 것.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimerData())
    }
}
