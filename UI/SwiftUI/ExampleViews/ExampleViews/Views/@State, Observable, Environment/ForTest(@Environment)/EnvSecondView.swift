//
//  EnvSecondView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//

import SwiftUI

struct EnvSecondView: View {
    
    @EnvironmentObject var timerData: TimerData
    //얘는 다른뷰를 통해 값을 전달받은 것이아니라, 자기 스스로 클래스의 인스턴스를 새로 생성한 것.
    
    var body: some View {
        
        VStack {
            Text("Timer count = \(timerData.timeCount)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
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
        
    }
}

struct EnvSecondView_Previews: PreviewProvider {
    static var previews: some View {
        EnvSecondView()
            .environmentObject(TimerData())
    }
}
