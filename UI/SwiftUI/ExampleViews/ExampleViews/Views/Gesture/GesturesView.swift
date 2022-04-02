//
//  GesturesView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

struct GesturesView: View {
    
    //한 번의 탭 = like button.
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
    
    var body: some View {
        
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
        }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
