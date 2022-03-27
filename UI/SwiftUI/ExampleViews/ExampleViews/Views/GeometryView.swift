//
//  GeometryView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        GeometryReader { geometry in //컨테이너뷰의 크기를 파악하여 이를 기준으로, 내부 Views들의 frame에 다가갈 수 있음.
            VStack(spacing: 30) {
                Text("hello")
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                Text("하위~")
                    .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
            }
        }
    }
}

struct GeometryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView()
    }
}
