//
//  ExplicitAnimationView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

struct ExplicitAnimationView: View {
    
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    
    //MARK: 응용. 애니메이션과 상태 바인딩.
    @State private var visibility = false
    
    let colors = Gradient(colors: [.red, .orange, .yellow])
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    self.rotation =
                    (self.rotation < 360 ? self.rotation + 60 : 0)
                }
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            } label: {
                Rectangle()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: 0,
                                         endRadius: 50))
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
            }
            
            VStack {
                //MARK: 응용. 애니메이션과 상태 바인딩.
                Toggle(isOn: $visibility.animation(.linear(duration: 1))) {
                    Text("Toggle Text Views")
                }
                .padding()
                
                if visibility {
                    Text("Hello World")
                        .font(.largeTitle)
                }
                
                if !visibility {
                    Text("Goodbye World")
                        .font(.largeTitle)
                }
            }
        }

    }
}

struct ExplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationView()
    }
}
