//
//  ReadMe_Animation.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

/*
 MARK: - SwiftUI Animation과 전환(Transition)
 
 MARK: Animation - animation() modifier는 자기 이전의 수정자에게만 암묵적으로 적용된다. (순서를 고려해보기.)
 -> 화면상의 뷰 1) 회전, 2) 확대, 그리고 3) 동작 등의 다양한 형태를 취할 수 있음.
 
 -> 암묵적 애니메이션
 -> SwiftUI에 포함된 수많은 View는 크기, 불투명도, 색상, 회전 각도 등 뷰의 외형을 제어하는 프로퍼티들을 가지고 있다.
 -> 이런 종류의 프로퍼티는 어떤 상태 -> 다른 상태로 바뀌는 것을 Animation되게 할 수 있다.
 -> animation() modifier를 사용하면되는데, 이것이 암묵적 애니메이션이란 개념이며, 애니메이션 수정자 앞에 있는 모든 수정자에 암묵적으로 애니메이션되도록 하기 때문이다.
 
 1. 회전 rotationEffect
 -> rotation값을 가지는 @State 변수를 생성하고, 이 값을 할당하는 .rotationEffect(.degrees(rotation))에 넣음으로써 효과를 줄 수 있다.
 -> @State를 사용해야 값이 변할 때 SwiftUI가 뷰를 업데이트하면서 애니메이션 효과를 볼 수 있게된다.
 -> rotation값을 조절하는 요소를 binding을 통해 지정해줄수도있다. 대표적인 예가 Slider() ~!! RotationView file 참고.
 -> .rotationEffect()메서드에는 Angle, Anchor등의 전달인자를 받을 수 있는데,
 -> MARK: Angle에는 대표적으로 흔히 사용하는 .degree와 .radians가 있다. TODO: radians 알아보기!!!
 
 -> BUT!!! 이 상태는 단순히 뷰가 변하는 것이지, 이동하는 과정 즉, animation효과는 아직 없는 상태이다. 이런 변화에 animation을 암묵적으로 넣어보도록하자.
 
 -> Animation객체 종류.
 1) .linear - 지정된 시간 동안 일정한 속도로 애니메이션 수행.
 2) .easeOut - 빠른속도로 시작하고 끝에 다다를수록 점점느려진다.
 3) .easeIn - 느린 속도로 시작하고 끝에 다다를수록 점점빨라진다.
 4) .easeInOut - 느린 속도로 시작하여 점점 속도를 올리다가 끝에 다다를수록 다시 점점느려진다.
 5) MARK: .spring(response:,dampingFraction:,blendDuration:) => 스프링처럼 애니메이션 효과가 지정된 범위를 살짝 넘어갔다가 다시 돌아오는 효과가 발생하면서 지정된 각도와 크기로 된다!!
 
 -> animation시간을 지정할 수도 있다. Ex) .animation(.linear(duration: 5))
 
 2. 뷰 크기확대, 축소 scaleEffect
 -> scale값을 가지는 @State 변수를 생성하고, 이 값을 할당하는 .scaleEffect(scale)에 넣음으로써 효과를 줄 수 있다.
 -> .scaleEffect의 scale값은 1이 자신의 원래 크기이며, 수치가 작아질수록 원래보다 작게, 수치가 커질수록 원래보다 커진다.!!!
 
 -> MARK: Animation은 하나 이상의 수정자에 적용할 수 있다. Ex) 회전 효과 + 크기 변화 효과
 -> TODO: 다시 원점으로 돌아가는 현상 어떻게 처리할지.
 
 3. 공통
 -> MARK: 둘다 anchor 매개변수를 통해, "회전축" or "크기가 커지는 방향" 등을 지정할 수 있다. 
 
 
 MARK: Animation 반복
 -> 원래 default로는 애니메이션은 단 한번만 수행된다.
 -> but, 한 번 이상 반복하도록 구성할 수도 있다.
 -> MARK: 구현은 간단하다. .animation() modifier안의 Animation객체의 마지막에 .repeatCount()수정자를 지정하면된다! 무함대로하려면 .repeatForever() -> autoReverse: false 권장!
 -> 근데 웬만하면 쓰지말자. 동작이 이상하다;
 
 MARK: 명시적 애니메이션 (withAnimation)
 -> animation()은 암묵적 애니메이션이다. animation() 수정자 이전에 있는 뷰의 모든 프로퍼티가 애니메이션되도록 구현된다.
 
 -> withAnimation() 클로저를 사용하여 명시적 애니메이션을 사용할 수도 있다.
 -> withAnimation() 클로저 내에서 변경된 프로퍼티만 애니메이션된다. 
 
 
 MARK: 번외. 응용. 애니메이션과 상태 바인딩.!!!
 -> 상태값(@State) 변경의 결과로 일어나는 뷰의 변화를 애니메이션되도록 상태 프로퍼티 바인딩에 애니메이션을 적용해보기!
 
 MARK: Transition
 -> 레이아웃에서 뷰가 추가되거나 제거될 때 뷰가 어떻게 나타나고 사라질지를 정의한다.
 -> ex) 뷰가 추가될 때 미끄러져 들어오고 사라질 때는 움츠러들며 사라지도록 정의하는 것이 가능.
 
 -> SwiftUI 도서 302page 참고.
 -> 혹은 ExplicitAnimationView Toggle부분 참고.
 
 -> transition() modifier에 전환스타일 modifier를 전달하여 지정할 수도 있다.
 <종류>
 1) .slide: 뷰가 슬라이딩하여 들어오거나 나간다.
 2) .scale: 뷰의 크기가 커지면서 나타나고 작아지면서 사라진다.
 3) .move(edge: edge): 지정된 방향으로 뷰가 이동되며, 추가되거나 제거된다.
 4) .opacity: 디폴트 전환 효과로 페이드되는 동안 크기와 위치를 유지한다.
 
 -> 음 써봤을 때, 체감은 그냥 뷰 사라질때만 transition효과 나타나고있다~ @ 해결. preview에서만 그리보이는거였다.
 -> .combined(with:)사용하여 여러 transition을 중복시킬수있고, combined()를 계속 이어서 3개이상도 중복시킬수있다!
 */
