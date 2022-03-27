//
//  Readme2.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/27.
//

import Foundation

/*
MARK: - 1. @State private var... 상태 프로퍼티...
 상태에 대한 가장 기본적인 형태.
 String, Int, Bool값 등 간단한 데이터 타입을 저장하기 위해 주로 사용된다.
 
 @State : 현재 View의 상태값을 저장.
 현재 View의 값을 저장하는 것이니 반드시 private하게 선언.
 
 View안에서 Binding 할 수 있음.
 Binding할 시에는 $를 붙여주면 됨. ex) TestView2참고.
 
 binding을 통해 값이 변경되면, SwiftUI가 뷰 계층을 업데이트, 즉, 다시 렌더링함.
 
 이런 값을 참조할 곳에서 참조하여 사용하면된다.
 
 만약, @State프로퍼티가 있는 뷰가 아닌, 그 하위뷰에서 이 프로퍼티값을 참조하고싶다면,
 하위 뷰에서 @Binding 프로퍼티래퍼를 사용하여 프로퍼티를 선언하고,
 뷰를 초기화할 때 이 값을 $를 사용하여 전달하면된다.
 
 이런 @State상태 프로퍼티는 뷰의 상태를 저장하는 방법을 제공하며 해당 뷰에만 사용할 수 있다.
 즉, 하위 뷰가 아니거나 상태 바인딩이 구현되어 있지 않은 다른 뷰는 접근할 수 없다.
 
MARK: 상태 프로퍼티는 "* 일시적인 것이어서! *" 부모 뷰가 사라지면 그 상태도 사라진다.
 */



/*
MARK: - 2. Observable 객체.
 MARK: @State와 달리, Observable 객체는 여러 다른 뷰들이 외부에서 접근할 수 있는 "* 영구적인 데이터를! *" 표현하기 위해 사용된다.
 
 Observable객체는 ObservableObject프로토콜을 따르는 '클래스'나 '구조체'형태이다.
 일반적으론, 시간에 따라 변경되는 하나 이상의 데이터 값을 모으고 관리하는 역할을 담당한다.
 
 또한, 타이머나 알림(notification)과 같은 이벤트를 처리하기 위해 사용될 수도 있다.
 
 Observable객체가 published property로서 데이터값을 publish함.
 -> Observer객체가 게시자를 subscribe하여, 게시된 프로퍼티가 변경될 때마다 업데이트를 받는다. like @State메커니즘
 
 게시된 프로퍼티와의 바인딩을 통해 Observable객체에 저장된 데이터가 변경됨을 반영하기 위해 SwiftUI 뷰는 자동으로 업데이트된다.
 
 이 Observable객체는 Combine 프레임워크에 포함되어있음.
 
 Combine 프레임워크를 이용하여,
 1) 여러 게시자를 하나의 스트림으로 병합하기.
    * 스트림: 시간이 지남에 따라 사용할 수 있게 되는 일련의 데이터 요소를 가리키는 수많은 방식에서 쓰인다.
 2) 게시된 데이터를 구독자 요구에 맞게 변형하기.
 3) 최초 게시자와 최종 구독자 간에 복잡한 수준의 연쇄 데이터 처리 작업 구현하기.
 등등 다양한 기능 있음.
 
 하지만, 일반적으론, 내장된 게시자 타입들 중 하나면 충분할 것이다!
 
 <Observable객체의 published property를 구현하는 가장 쉬운 방법>
 - @Published 프로퍼티 래퍼 사용하기. : 이 래퍼는 래퍼 프로퍼티 값이 변경될 때마다 모든! 구독자에게 업데이트를 알리게됨.
 
 observable객체 예시) DemoData 파일 참고.
 */
