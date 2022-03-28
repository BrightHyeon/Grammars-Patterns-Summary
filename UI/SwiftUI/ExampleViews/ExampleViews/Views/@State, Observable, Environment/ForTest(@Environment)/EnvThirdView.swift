//
//  EnvThirdView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//

import SwiftUI

struct EnvThirdView: View {
    
    @EnvironmentObject var timerData: TimerData
    //얘는 이전뷰에서 데이터를 전달받은것이 아니다! 그냥 앱 런칭되며 뷰연결될 때 다함께 초기화!
    
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

struct EnvThirdView_Previews: PreviewProvider {
    static var previews: some View {
        EnvThirdView()
            .environmentObject(TimerData())
    }
}
