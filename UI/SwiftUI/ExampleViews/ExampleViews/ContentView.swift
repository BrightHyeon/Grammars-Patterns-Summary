//
//  ContentView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
