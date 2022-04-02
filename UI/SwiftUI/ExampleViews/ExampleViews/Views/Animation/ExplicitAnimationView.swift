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
    
    //MARK: 특정버튼없이 자동으로 애니메이션 시작하기.
    //상태 변화를 전달할 용도의 @State bool 프로퍼티.
    @State private var isSpinning: Bool = false
    
    let colors = Gradient(colors: [.red, .orange, .yellow])
    
    var body: some View {
        VStack {
            
            //MARK: 명시적 애니메이션
            Button {
                withAnimation(.easeInOut(duration: 1)) {
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
                //MARK: 번외. 응용. 애니메이션과 상태 바인딩.!!!
                //상태값(@State) 변경의 결과로 일어나는 뷰의 변화를 애니메이션되도록 상태 프로퍼티 바인딩에 애니메이션을 적용해보기!
                Toggle(isOn: $visibility.animation(.linear(duration: 1))) {
                    Text("Toggle Text Views")
                }
                .padding()
                
                if visibility {
                    Text("Hello World")
                        .font(.largeTitle)
                    //transition안달면, default인 opacity형태로 페이드된다.
                    //TODO: 왜 안되냐. insertion. @된다!! preview에서만 안되는듯.
                        .transition(.asymmetric(
                            insertion: .move(edge: .top).combined(with: .opacity).combined(with: .slide),
                            removal: .scale)) //이런식으로 비대칭전환도 가능.
                }
                
                //MARK: 동작보고싶으면 주석 풀고 써보도록!
//                if !visibility {
//                    Text("Goodbye World")
//                        .font(.largeTitle)
//                        .transition(.slide)
//                }
////
//                if visibility {
//                    Text("HIHIHIHIHIHI")
//                        .transition(.scale)
//                }
                
                
                //MARK: 특정버튼없이 자동으로 애니메이션 시작하기.
                ZStack {
                    Circle()
                        .stroke(.blue, lineWidth: 2)
                        .frame(width: 200, height: 200)
                    
                    Image(systemName: "forward.fill")
                        .font(.largeTitle)
                        .offset(y: -100)
                        .rotationEffect(.degrees(isSpinning ? 360 : 0))
                        .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: isSpinning ? 360 : 0)
                    //MARK: IMPORTANT - autoreverses를 false해줘야 자동으로 역방향으로 돌아가는(반복 시, 원점으로 돌아가려는) 현상 나타나지않음.!
                }
                .onAppear {
                    self.isSpinning.toggle()
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
