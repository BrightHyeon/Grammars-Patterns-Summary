//
//  ThirdView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//

import SwiftUI

struct ThirdView: View {
    
    //이전뷰를 통해 timerData를 전달받을 프로퍼티.
    @ObservedObject var timerData: TimerData
    //이 역시 같은 @ObservedObject 프로퍼티 래퍼로 씌어줘야함.
    //그래야 값이 변경될때마다 뷰가 정상적으로 업데이트된다.(SwiftUI에 의해서!)
    
    var body: some View {
        VStack {
            Text("Third View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
            
            Button {
                timerData.isPaused = !timerData.isPaused
                timerData.stopCount()
            } label: {
                if timerData.isPaused {
                    Text("Continue")
                } else {
                    Text("Stop")
                }
            }
            .padding()
            
            Button {
                timerData.resetCount()
            } label: {
                Text("Reset Counter")
            }
            .padding()
        }
        .padding()
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(timerData: TimerData())
    }
}
