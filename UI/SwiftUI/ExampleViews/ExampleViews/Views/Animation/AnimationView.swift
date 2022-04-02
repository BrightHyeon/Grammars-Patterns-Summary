//
//  AnimationView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var rotation1: Double = 0
    @State private var rotation2: Double = 0
    @State private var rotation3: Double = 0
    
    @State private var rotation4: Double = 0
    @State private var scale: CGFloat = 1
    
    @State private var rotation5: Double = 0
    @State private var scale2: CGFloat = 1
    
    var body: some View {
        VStack {
            Button {
                self.rotation1 = (self.rotation1 < 360 ? self.rotation1 + 60 : 0)
            } label: {
                Text("Linear Rotation!!!")
                    .rotationEffect(.degrees(rotation1))
                    .animation(.linear, value: rotation1)
            }
            .padding()
            
            Button {
                self.rotation2 = (self.rotation2 < 360 ? self.rotation2 + 60 : 0)
            } label: {
                Text("EaseIn Rotation!!!")
                    .rotationEffect(.degrees(rotation2))
                    .animation(.easeIn, value: rotation2)
            }
            .padding()
            
            Button {
                self.rotation3 = (self.rotation3 < 360 ? self.rotation3 + 60 : 0)
            } label: {
                Text("With Duratin Rotation!!!")
                    .rotationEffect(.degrees(rotation3))
                    .animation(.easeInOut(duration: 3), value: rotation3)
            }
            .padding()
            
            Button {
                self.rotation4 = (self.rotation4 < 360 ? self.rotation4 + 60 : 0)
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            } label: {
                Text("Rotation + Scale + <Animation>")
                    .scaleEffect(scale, anchor: .bottomLeading)
                    .rotationEffect(.degrees(rotation4))
                    .animation(.easeInOut(duration: 3), value: rotation4)
            }
            .padding()
            
            Button {
                self.rotation5 = (self.rotation5 < 360 ? self.rotation5 + 60 : 0)
                self.scale2 = (self.scale2 < 2.8 ? self.scale2 + 0.3 : 1)
            } label: {
                Text("Rotation + Scale + <Animation>")
//                    .scaleEffect(scale2)
                    .rotationEffect(.degrees(rotation5))
                    .animation(.spring(response: 0.2, //속도 = duration
                                       dampingFraction: 0.1, //감쇠율 - 클수록 마찰력 쎄서 살살 튕기고, 낮을수록 세게 튕김.
                                       blendDuration: 0).repeatCount(3), //모르겠음.
                               value: rotation5)
                    .scaleEffect(scale2) //순서의 중요성! animation modifier보다 이후에 위치하면, animation효과는 적용되지 않음.
                //-> 동작: 크기는 한번에 변화고 회전은 animation에 의해 서서히 발생함.
            }
            .padding()
            
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
