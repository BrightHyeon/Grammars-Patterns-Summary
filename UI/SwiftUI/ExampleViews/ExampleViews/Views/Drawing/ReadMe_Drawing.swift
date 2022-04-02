//
//  ReadMe_Drawing.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/01.
//

import Foundation

/*
 <SwiftUI 그래픽 드로잉 기초> - SwiftUI 2D 드로잉 기술
 
 : SwiftUI는 내장된 도형과 그래디언트 드로잉뿐만 아니라, Shape프로토콜과 Path프로토콜을 따르는 완전히 새로운 뷰를 생성하여 커스텀 드로잉을 할 수 있게도 한다.
 
 # Shape 프로토콜을 따르는 다섯 개의 미리 정의된 도형.
 # -> 원 Circle(), 사각형 Rectangle(), 모서리가 둥근 사각형 RoundedRectangle(), 타원 Ellipse(), 캡슐 Capsule() 등등.
 # -> 이들은 frame을 지정해주지않는이상, 자신에게 주어진 공간의 최대치를 디폴트로 사용한다!
 
 
 1. Circle()
 
 
 2. Ellipse()
 
 
 3. Rectangle()
 
 
 4. RoundedRectangle()
 
 
 5. Capsule()
 -> 이걸 모를 땐, RoundedRectangle에서 cornerRadius를 높이의 1/2만큼 줘서, 이 모양을 만들었는데, 이젠 이걸 써야겠다~!!!.
 
 
 6. 공통
 -> stroke() modifier를 요긴하게 사용할 수 있음.
 TODO: -> .stroke(style: StrokeStyle()) -> StrokeStyle인스턴스를 이용하여 각종 도형 설정해보자!
 -> StrokeStyle 매개변수들
 <lineWidth: 알쥐?, dash랑 dashPhase도 대충 알쥐? lineCap은 선의 모양을 정의하는 거고, lineJoin은 선과선이 만나는 모서리지점의 모양을 정의한다.!!!>
 -> lineCap : .round, .square, .butt 있는데, round말고 다른 두 가지는 그냥 각진 선 모양임.
 -> lineJoin : .round, .bevel, .miter 있는데, round는 둥글게 마감되고, bevel은 약간 네모처럼 마감되고, miter는 위쪽 모서리만 네모되고, 밑변은 그냥 뾰족하게 된다. 
 
 -> frame을 수치로 설정하는 방법을 너무 좋아하지말자. 사용자의 화면크기에 따라 동적으로 변화하는 것이 더 좋은 디자인인듯하다.
 TODO: -> 그러므로, 화면의 View?크기에 접근해서 사이즈를 조절하는 방법을 제대로 익혀보자!
 
 -> 도형을 그릴 때 외곽선을 그리면서 도형의 안을 색으로 채우기 위해 fill과 stroke을 결합하려하는데 이것은 불가능하다.
 -> 하지만, 색을 채운 도형 위에 외곽선을 위에 두는 방법으로 할 수 있다.
 
 
 
 7. Path()
 -> 도형들은 기본적으로 Shape프로토콜을 따르는 구조체 객체이며, 이 프로토콜을 준수하기 위해선 CGRect 형태의 사각형을 받아 그 사각형에 그려질 것을 정의하는 Path객체를 반환하는 path() 함수를 구현해야함.
 
 -> Path() 인스턴스는 포인트 간의 "1. 좌표를 지정"하고, "2. 그려질 선을 정의"하여 2차원 도형을 제공한다.
 -> 포인트 간의 선은 1) 직선, 2) 3차 및 2차 베지어 곡선, 3) 호, 4) 타원, 5) 사각형 등을 사용하여 그릴 수 있다.
 
 -> Path는 커스텀 도형 구현에 사용될 뿐만 아니라 View에 직접 그려질 수도 있다.
 
 -> 처음 Path안에 들어온 인자(path = Path()객체의 활동값?; 임시이름)는 사용가능한 CGRect공간 안에서 CGPoint(x:0, y:0)에 위치해있는 것 같다.
 -> move()메서드를 통해 시작점을 정하고, addLine()메서드를 이용하여 "좌표를 지정함과 동시에 그 좌표로 선"을 추가한다.
 -> 도형을 그리는 것이기에, 좌표포인트가 최소 2개는 직혀야함. 다 직선일때는 3개!!! 포물선일 때는 2개여도 제어점 잘 설정하면 쉽게 그릴 수 있음. 
 
 -> Summary: 기존 Shape프로토콜을 따르는 도형들도 path()메서드를 내장?한다. // func path(in rect: CGRect) -> Path() // 특정공간 or 주어진공간 안(CGRect)에서 경로를 그려내는 것임. //주어진 공간을 초과하는 경로가 주어져도 일단 그리는 것 같음.
 
 -> Important: Path()객체의 경로를 설정할 때 CGRect의 비율에 맞춰서 좌표를 설정하면, 뷰에 적용할 때의 frame에 맞게 동적으로 크기를 조절할 수 있다.!!!
 
 ### 경로관련 메서드들.
 - move() : 시작점 좌표를 지정.
 - addArc() : 반지름과 각도 값을 기반으로 호를 추가함.
 - addLine() : 지정된 포인트까지 선을 추가함.
 - addCurve() : 주어진 좌표와 제어점(기준점)을 사용하여 3차 베지어 곡선을 추가.
 - addQuadCurve() : 주어진 좌표와 제어점(기준점)을 사용하여 2차 베지어 곡선을 추가.
 - addLines() : 지정된 끝점들의 배열 간에 선을 추가함.
 - closeSubPath() : 끝점과 시작점을 연결하여 경로를 닫는다. 
 
 * 참고자료들
 <StrokeStyle()>
 https://ichi.pro/ko/swiftui-dijain-seon-seutail-ui-strokestyle-218716609238284
 
 
 */
