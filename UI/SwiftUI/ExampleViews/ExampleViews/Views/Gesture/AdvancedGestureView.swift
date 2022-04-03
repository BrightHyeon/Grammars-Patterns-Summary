//
//  AdvancedGestureView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/03.
//

import SwiftUI

struct AdvancedGestureView: View {
    //simultaneously
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    //sequenced
    @GestureState private var offset2: CGSize = .zero
    @State private var dragEnabled: Bool = false
    
    var body: some View {
        
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, transaction in
                state = value //지정시간보다 더 눌리면 value가 true가 될 듯?
            }
            .simultaneously(with: DragGesture()) //동시에 수행해야한다.
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            } //first, seconed ... -> simul로 묶여있으니 순서물어보는듯?
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded { _ in
                self.dragEnabled.toggle() //2초 후에 true된다.
            }
            .sequenced(before: DragGesture()) //그다음놈은 DragGesture()
            .updating($offset2) { value, state, transaction in
                
                switch value {
                    
                case .first(true):
                    print("Long press in progress")
                    
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                    
                default: break
                }
            }
            .onEnded { _ in
                self.dragEnabled = false
            }
        
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(longPressAndDrag)
            
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .offset(offset2)
                .gesture(longPressBeforeDrag)
            //어렵다... 나중에 다시보자.
        }
    }
}

struct AdvancedGestureView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedGestureView()
    }
}
