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
                
                Button {
                    timerData.resetCount()
                } label: {
                    Text("Reset Counter")
                }
                .padding()

            }
            
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
