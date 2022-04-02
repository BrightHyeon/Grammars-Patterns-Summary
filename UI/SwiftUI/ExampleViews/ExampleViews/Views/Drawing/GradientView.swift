//
//  GradientView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//
/*
 READ_ME
 MARK: <Gradient>
 - 그라데이션 효과를 보여주는 색상배열.
 - Gradient에 포함될 색상 배열과 Gradient를 렌더링하는 방식을 제어하는 값으로 초기화된 Gradient객체로 그려진다.
 
 - Gradient(colors: [Color]) 객체를 만들고, 이를 여러 형태의 gradient매개변수에 전달인자로 넣어주면된다.
 
 - 종류
 1. 방사형 RadialGradient(gradient:,center:,startRadius:,endRadius)
 : circle형태로 중심으로부터 바깥방향으로 번져나가는 형태의 그라데이션.
 -> center: gradient의 시작점. .leading, .top, .zero, ... 등등 다양하다.
 -> startRadius: 첫번째 색상의 radius인듯. 이 수치가 커질수록 첫 색상의 번짐도 UP!
 -> endRadius: 전체적인 색상의 radius인듯. 이 수치가 도형의 반지름보다 커지면 커질수록, 배열의 뒷쪽에 있는 색상들이 사라져버림. 모든색을 균일하게 보이도록 하려면, Radius범위를 그 도형의 반지름만큼 해야할듯하다!!!
 
 2. 원뿔형 AngularGradient(gradient:,center:)
 : 말그대로 원뿔형. center로 지정된 곳에 중심자리잡고, 슥 시계방향으로 색 돌아감.
 -> center: 그냥 .center로 그리는 것이 가장 무난해보인다.
 
 3. 선형 LinearGradient(gradient:,startPoint:,endPoint:)
 : 선형. 매끄럽게 선들이 수평으로 이어지는 느낌?
 -> startPoint, endPoint: 그냥 그라데이션이 시작되고 끝나는 지점 등록.
 */
import SwiftUI

struct GradientView: View {
    
    let colors = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple])
    
    var body: some View {
        
        VStack {
            HStack {
                Text("방사형 - RadialGradient")
                Spacer()
                //-----
                Circle()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(50)))
                .frame(width: 100, height: 100)
                //-----
            }
            .padding(.horizontal)
            
            
            HStack {
                Text("원뿔형 - AngularGradient")
                Spacer()
                //-----
                Circle()
                    .fill(AngularGradient(gradient: colors,
                                          center: .center))
                    .frame(width: 100, height: 100)
                //-----
            }
            .padding(.horizontal)
            
            
            HStack {
                Text("선형 - LinearGradient")
                Spacer()
                //-----
                Circle()
                    .fill(LinearGradient(gradient: colors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 100, height: 100)
                //-----
            }
            .padding(.horizontal)
            
            //MARK: 응용. overlay가 아닌, background에 색입히는 방식으로 겹쳐보자.
            HStack {
                Text("응용버전 1")
                Spacer()
                QuadCurveShape()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(60)))
                    .background(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow]),
                                               startPoint: .topTrailing,
                                               endPoint: .bottomLeading))
                .frame(width: 100, height: 100)
            }
            .padding(.horizontal)
            
            HStack {
                Text("응용버전 2")
                Spacer()
                RainShape()
                    .fill(AngularGradient(gradient: colors,
                                          center: .center))
                    .background(LinearGradient(gradient: colors,
                                               startPoint: .topTrailing,
                                               endPoint: .bottomLeading))
                .frame(width: 100, height: 100)
            }
            .padding(.horizontal)
        }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
