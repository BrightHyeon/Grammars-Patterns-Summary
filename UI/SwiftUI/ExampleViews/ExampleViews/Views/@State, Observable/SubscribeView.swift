//
//  SubscribeView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import SwiftUI

struct SubscribeView: View {
    
    @ObservedObject var demoData: DemoData
    
    var body: some View {
        Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
    }
}

struct SubscribeView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribeView(demoData: DemoData())
    }
}
