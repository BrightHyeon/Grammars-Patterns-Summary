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
