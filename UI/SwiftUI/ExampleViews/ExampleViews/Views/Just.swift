//
//  Just.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/01.
//

import SwiftUI

struct Just: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0...3, id: \.self) {
                    Text("ee \($0)")
                }
            }
        }
    }
}

struct Just_Previews: PreviewProvider {
    static var previews: some View {
        Just()
    }
}
