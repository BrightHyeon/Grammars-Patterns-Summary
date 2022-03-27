//
//  WifiImageView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import SwiftUI

struct WifiImageView: View {
    
    @Binding var wifiEnabled: Bool //상위뷰의 @State 상태프로퍼티를 Binding하여 상태값 받아옴.
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

