//
//  TimeAndSecondTabView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//  주요 기술 - TabView, .tabItem

import SwiftUI

struct TimeAndSecondTabView: View {
    
    //TODO: TabView다룰때, @State - Enum조합, selection, tag이런거 안써도 지금 대충보기엔 잘돌아가는 것 같은데 왜 사용해야하는거지??? (MyAssets프로젝트참고)
    
    var body: some View {
        TabView {
            TimeView()
                .tabItem {
                    Image(systemName: "star")
                }
            
            SecondView()
                .tabItem {
                    Image(systemName: "calendar")
                }
        }
    }
}

struct TimeAndSecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndSecondTabView()
    }
}
