//
//  GesturesView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

struct GesturesView: View {
    
    //한 번의 탭 = like button. //얘네 변수 body안에넣어도 안넣어도됌.
    let tap = TapGesture()
        .onEnded { _ in
            print("Tapped")
        }
    
    //더블 탭 제스쳐 (count의 수치를 올리면 손쉽게, 3탭, 4탭, 5탭도 구현이 가능하다.)
    let doubleTap = TapGesture(count: 2) //참쉽쥬?
        .onEnded { _ in
            print("Double Tapped")
        }
    
    //롱 프레스 제스쳐 - 따로 시간 조절하지않으면 default값인 0.5초 기준이다.
    let longPress = LongPressGesture()
        .onEnded { _ in
            print("Long Pressed")
        }
    
    //롱 프레스 제스쳐 - 시간조절(min...: 프레스 최소시간, max...: 허용범위. 이 거리이상 요소로부터 손가락이 멀어지면 안누른것으로 간주한다. 이런느낌.)
    let customLongPress = LongPressGesture(minimumDuration: 2,
    /*적용되는 View의 범위 생각해서 적당히하자.*/   maximumDistance: 25)
        .onEnded { _ in
            print("Custom Long Pressed")
        }
    
    //확대(핀치) 제스쳐
    let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
        .onChanged({ _ in
            print("Magnifying")
        })
        .onEnded { _ in
            print("Gesture Ended")
        }
    
    //확대 응용버전.
    @State private var magnification: CGFloat = 1.0
    
    //확대 응용2.
    @GestureState private var magnification2: CGFloat = 1.0
    
    //.updating이용한 드래그 제스쳐.
    @GestureState private var offset: CGSize = .zero
    
    //드래그 응용
    @State private var predictedOffset: CGSize = .zero
    
    var body: some View {
        
        //이용할 @State변수가 있을 경우, body안에 넣기?
        let magnificationGesture2 = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in //MagnificationGesture는 Value인스턴스가 있다. 핀칭 값이 변할때마다 onChanged가 호출이 될 것이고, value가 magnification변수에 할당될 것임.
                self.magnification = value
            }
            .onEnded { _ in
                print("Gesture Ended")
            }
        
        let magnificationGesture3 = MagnificationGesture(minimumScaleDelta: 0)
            .updating($magnification2) { magValue, state, transaction in
                state = magValue
            }
        
        //.updating이용한 드래그 제스쳐.
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
                state = dragValue.translation
            }
        
        //응용버전 drag.
        let drag2 = DragGesture()
            .onChanged { dragValue in
                self.predictedOffset = dragValue.predictedEndTranslation
            }
        
        VStack {
            
            HStack {
                Text("Tap")
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .gesture(tap)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .gesture(doubleTap)
            }
            
            HStack {
                Text("Long Press")
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "star.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .gesture(longPress)
                
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .gesture(customLongPress)
            }
            
            HStack {
                Text("Magnification")
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "star.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .gesture(magnificationGesture)
                
                //값이 변화함에따라 scaleEffect발생하도록~!
                //.onChanged -> @State변수에 할당 -> scaleEffect에 변수넣기.
                Image(systemName: "star.square.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(magnification)
                    .frame(width: 50, height: 50)
                    .gesture(magnificationGesture2)
                    //.gesture, .frame 수정자 순서 No 상관.
                
                Image(systemName: "star.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(magnification2)
                    .frame(width: 50, height: 50)
                    .gesture(magnificationGesture3)
            }
            
            HStack {
                Text("Drag")
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "star.bubble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .offset(offset)
                    .gesture(drag)
                
                Image(systemName: "star.bubble.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .offset(predictedOffset)
                    .animation(.linear(duration: 2), value: predictedOffset)
                    .gesture(drag2)
                //대박! animation duration과 결합하니 자연스럽게 잘날아감~!!!
            }
        }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
