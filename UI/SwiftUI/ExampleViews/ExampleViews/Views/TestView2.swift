//
//  TestView2.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import SwiftUI

struct TestView2: View {
    
    //MARK: 상태 프로퍼티. 기본값 셋. Binding한 값이 변경되면 자동으로 업데이트됨.
    @State private var wifiEnabled = false
    @State private var userName = ""
    
    var body: some View {
        VStack {
            
            //wifiEnabled Binding
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            
            //userName Binding
            TextField("Enter user name", text: $userName)
            //MARK: 여기 text값을 입력하면 userName상태프로퍼티에 변화가 생기고, 이런 변화가 생길 때마다 뷰 계층구조는 SwiftUI에 의해 다시 렌더링됨.
            
            //userName 참조
            Text(userName)
            
            //wifiEnabled 참조
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
            
            //How to bind to a subview?
            WifiImageView(wifiEnabled: $wifiEnabled)
            //Toggle -> wifiEnabled -> WifiImageView's wifiEnabled
        }
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
