//
//  DrawDemo.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/01.
//

import SwiftUI

struct DrawDemoView: View {
    var body: some View {
        
        VStack {
            
            //이들 Shape프로토콜의 요소들은 자기가 차지할 수 잇는 최대한을 차지한다!.
            //그러니 조절하려면 frame을 적용해줘야함!!!
            
            HStack {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    //Warning: Cirlce()은 정비율이니 한값만줘도 되는거아니냐 할 수 있지만, 그럼 height 공간을 최대치로 사용하기에 다른 뷰들이 그만큼 밀리게된다.
                Circle()
                    .stroke(.red, lineWidth: 10)
                    //Tip: lineWidth는 원래 크기보다 더 두꺼워짐.
                    .frame(width: 70, height: 70)
                    //Tip이어서: 그러니 원래 사이즈를 줄여야 사이즈 동일.
            }
            
            
            HStack {
                Ellipse()
                    .fill(.purple)
                .frame(width: 100, height: 50)
            }
            
            
            HStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 50)
                
                Rectangle()
                    .stroke(.blue, style: StrokeStyle(lineWidth: 5,
                                                        dash: [10])) //dash: 점선간격.
                    .frame(width: 100, height: 50)
            }
            
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow)
                    .frame(width: 100, height: 50)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.yellow, style: StrokeStyle(lineWidth: 5,
                                                        dash: [10, 5],
    //dash배열에 숫자 1개: 점선의 길이. 숫자 2개: 숫자길이, 간격. 숫자 3개 이상: 감당안될 패턴나옴.
                                                        dashPhase: 20)) //이거 용도 잘 이해못함.
                    .frame(width: 100, height: 50)
            }
            
            
            //RoundedRec... tip!
            //cornerRadius대힌 cornerSize사용해서, 좀 더 다이나믹한 모서리 만들 수 있음.
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 30))
                    .fill(.black)
                    .frame(width: 100, height: 50)
            }
            
            
            HStack {
                Capsule()
                    .fill(.green)
                    .frame(width: 100, height: 50)
                
                Capsule()
                    .fill(.green)
                    .overlay(Capsule()
                                .stroke(.pink, lineWidth: 10)
                                .frame(width: 90, height: 40))
                    .frame(width: 100, height: 50)
            }
            
            
            //기존 Shape프로토콜을 따르는 도형들오 path()메서드를 내장?한다.
            //func path(in rect: CGRect) -> Path()
            //특정공간 or 주어진공간 (CGRect)에서 경로를 그려내는 것임.
            //주어진 공간을 초과하는 경로가 주어져도 일단 그리는 것 같음.
            HStack {
                Path { path in //Path()객체 = path로 임시네임?
                    path.move(to: CGPoint(x: 0, y: 0)) //첫좌표지정.
                    path.addLine(to: CGPoint(x: 30, y: 100)) //선 잇기.
                    path.addLine(to: CGPoint(x: 100, y: 70)) //선 잇기.
                    path.closeSubpath() //시작점-끝점을 연결하여 경로를 닫는다!!!
                }
                .fill(.pink)
                .frame(width: 100, height: 100)
                
                //Custom Shape 도형모델들.
                //func path(in rect: CGRect) -> Path를 준수했으니, 일반적인 도형에 사용하는 modifier들을 동일하게 사용할 수 있다.
                QuadCurveShape()
                    .stroke(.pink, style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round, //선모양 정의
                        lineJoin: .round)) //선과 선 만나는 모서리 모양 정의
                    .frame(width: 100, height: 100)
                
                CurveShape()
                    .fill(.orange)
                    .overlay(CurveShape()
                                .stroke(.pink, style: StrokeStyle(lineWidth: 5, dash: [10, 2])))
                    .frame(width: 100, height: 100)
                
                RainShape()
                    .stroke(.pink, lineWidth: 10)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct DrawDemo_Previews: PreviewProvider {
    static var previews: some View {
        DrawDemoView()
    }
}
