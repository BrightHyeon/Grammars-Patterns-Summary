//
//  EnvTimeView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//

import SwiftUI

struct EnvTimeView: View {
    
    @EnvironmentObject var timerData: TimerData
    //얘의 경우는 옵저버(예를 들어 현재뷰)에서 초기화할 수 없음.
    //앱 런칭되며, 뷰가 연결될 때 초기에 초기화를 수행함.
    
    var body: some View {
        NavigationView {
            
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
                
                //Link로 연결하면서, 나의 timerData를 전달!
                NavigationLink(destination: EnvThirdView()) {
                    Text("Next Screen")
                }


            }
            .navigationTitle("For Use ObservableObject")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EnvTimeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvTimeView()
            .environmentObject(TimerData())
    }
}
