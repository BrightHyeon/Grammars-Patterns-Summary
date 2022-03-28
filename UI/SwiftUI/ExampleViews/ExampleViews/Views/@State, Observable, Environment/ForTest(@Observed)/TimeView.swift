//
//  TimeView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//

import SwiftUI

struct TimeView: View {
    
    @ObservedObject var timerData: TimerData = TimerData()
    
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
                NavigationLink(destination: ThirdView(timerData: timerData)) {
                    Text("Next Screen")
                }


            }
            .navigationTitle("For Use ObservableObject")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
