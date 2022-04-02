//
//  ExampleViewsApp.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/22.
//

import SwiftUI

@main
struct ExampleViewsApp: App {
    
    let demoData = DemoData() //DemoData객체의 인스턴스 생성.
    let timerData = TimerData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerData) //DemoDate객체의 인스턴스를 SwiftUI환경에 저장.
        }
    }
}


/*
 Xcode 꿀팁.
 
 복잡한 코드를 구성하다가, 정렬이 꼬일 때는
 Editor -> Structure -> Re-indent누르면 된다.
 */
