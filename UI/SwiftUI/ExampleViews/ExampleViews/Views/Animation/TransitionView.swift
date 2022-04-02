//
//  TransitionView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isButtonVisible: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 2))) {
                Text("Show/Hide Button")
            }
            
            if isButtonVisible {
                Button {
                    
                } label: {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.allTranstionCombined)

            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
