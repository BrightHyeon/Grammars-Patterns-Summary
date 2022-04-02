//
//  GradientView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

/*
 READ_ME
 <Gradient>
 - 그라데이션 효과를 보여주는 색상배열.
 - Gradient에 포함될 색상 배열과 Gradient를 렌더링하는 방식을 제어하는 값으로 초기화된 Gradient객체로 그려진다.
 
 - Gradient(colors: [Color]) 객체를 만들고, 이를 여러 형태의 gradient매개변수에 전달인자로 넣어주면된다.
 
 - 종류
 1. 방사형 RadialGradient(gradient:,center:,startRadius:,endRadius)
 -> startRadius: 첫번째 색상의 radius인듯. 이 수치가 커질수록 첫 색상의 번짐도 UP!
 -> endRadius: 전체적인 색상의 radius인듯. 이 수치가 도형의 반지름보다 커지면 커질수록, 배열의 뒷쪽에 있는 색상들이 사라져버림. 모든색을 균일하게 보이도록 하려면, Radius범위를 그 도형의 반지름만큼 해야할듯하다!!!
 
 2. 원뿔형 AngularGradient(gradient:,center:)
 
 3. 선형 LinearGradient(gradient:,startPoint:,endPoint:)
 */


import SwiftUI

struct GradientView: View {
    
    let colors = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple])
    
    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: colors,
                                 center: .center,
                                 startRadius: CGFloat(0),
                                 endRadius: CGFloat(50)))
            .frame(width: 100, height: 100)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
