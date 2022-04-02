//
//  CustomShapeStructs.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

//MARK: QuadCurve & Curve에서 control은 제어점이다. 이 좌표를 꼭 지난다는 것이 아니라, 말 그대로 제어점이다. 베지어 곡선이 그려지는 모습을 구글링 통해 찾아보면, 두 점과 기준점을 잇는 삼각형이 있다고 했을 때, 아 뭐라해야되지, 암튼 제어점을 지나는 것이 아니라, 이 세 점 사이의 비율에 맞춰서 그려지는 것이다. 뭐 암튼 그러므로 제어점이 멀어질수록 곡선이 더 크게 휘는 것은 맞다.

struct QuadCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //MARK: 이렇게 CGRect의 비율에 맞춰서 좌표를 설정하면, 뷰에 적용할 때의 frame에 맞게 동적으로 크기를 조절할 수 있다.!!!
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY)) //잘못알았던 거 다시!!!! 얘도 선그리면서 움직인다. 책이 이상했음...
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        //그려나가는 순서가 중요할 듯. 1. 좌표 2. 선 그리기 3. 혹은 동시에! = like addLine() method.
        
        return path
    }
}

struct CurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //MARK: 이렇게 CGRect의 비율에 맞춰서 좌표를 설정하면, 뷰에 적용할 때의 frame에 맞게 동적으로 크기를 조절할 수 있다.!!!
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.minX - rect.midX, y: (rect.maxY / 3) * 1),
                      control2: CGPoint(x: rect.midX, y: (rect.maxY / 3) * 2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct RainShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.minX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath() //항상 이 마무리를 잘해야 끝점이 이쁘게 마감됨.
        
        return path
    }
}
