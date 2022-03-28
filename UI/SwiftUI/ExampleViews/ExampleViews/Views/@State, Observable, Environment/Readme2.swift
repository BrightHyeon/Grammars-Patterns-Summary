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
 
 MARK: @State - $바인딩, @State - 참조, @State - @Binding 전달 등등.
 
MARK: 상태 프로퍼티는 "* 일시적인 것이어서! *" 부모 뷰가 사라지면 그 상태도 사라진다.
 */



/*
MARK: - 2. Observable 객체.
 MARK: @State와 달리, Observable 객체는 여러 다른 뷰들이 외부에서 접근할 수 있는 "* 영구적인 데이터를! *" 표현하기 위해 사용된다.
 
 몇몇 SwiftUI View에 의해 사용되어야 할 경우에 적합.
 
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
 
 MARK: ObservableObject프로토콜 선언한 observable한 객체 - 그 안의 @Published 래퍼 프로퍼티 - @ObservedObject 래퍼 프로퍼티(구독자) - 구독한 뷰 및 그의 모든 하위뷰가 @State때 했던 것과 같은 방식으로 게시된 프로퍼티에 점근하게 됨.
 
 */


/*
 MARK: - Environment 객체
 구독객체(@ObservedObject)는 특정 상태가 앱 내의 몇몇 SwiftUI 뷰에 의해 사용되어야 할 경우에 가장 적합하다.
 
 그런데!! 어떤 View에서 다른 View로 navigation(이동)할 때 이동될 View에서도 동일한! 구독 객체에 접근해야 한다면, 이동할 때 대상 View로 @ObservedObject에 대한 참조체를 전달해야 할 것이다.
 이런 식으로 진행되다보면, 앱 내의 여러 뷰가 동일한 구독 객체에 접근해야 하는 경우, 복잡해질 수가 있다!!
 이 때는 Environment객체를 사용하는 것이 좋다.
 
 ex) SubscribeView, SecondView 파일 참고.
 
 Environment객체는 Observable객체와 같은 방식으로 선언된다.
 즉, 반드시 ObservableObject 프로토콜을 따라야 하며, 적절한 프로퍼티가 게시!되어야 한다.
 MARK: 하지만, 중요한!!! 차이점!!!은 이 객체는 SwiftUI환경에 저장되며, 뷰에서 뷰로 전달할 필요 없이 모든 뷰가 접근할 수 있다는 것이다.
 TODO: 그럼 ObservableObject는 뷰에서 뷰로 전달하는 방식으로만 해야된다는 건가??????
 
 Environment 객체를 구독하는 객체는 @EnvironmentObject 프로퍼티 래퍼를 이용하여 해당 객체를 참조한다.
 
 TODO: Environment객체는 옵저버 내에서 초기화될 수 없으므로?, 접근하는 뷰가 화면을 설정하는 동안 구성해야 한다!?
 */


/*
 MARK: - Summary
 
 1. @State
 : 사용자 인터페이스 레이아웃 내!의 뷰 상태를 저장하는데에 사용.
 : 현재 컨텐트뷰에 관한 것.
 : 임시값이기에 해당 뷰가 사라지면 값도 사라짐.
 
 2. Observable 객체
 : 사용자 인터페이스 밖!에 있으며, 앱 내의 SwiftUI 뷰 구조체의 하위 뷰에만 필요한 데이터에 사용.
 : 이 방법을 사용하기 위해선 ObservableObject프로토콜을 준수해야함.
 : 뷰와 바인딩될 프로퍼티는 @Published 프로퍼티 래퍼를 사용하여 선언.
 : 바인딩하려면 프로퍼티는 @ObservedObject 프로퍼티 래퍼를 사용해야함.
 
 3. Environment 객체
 : 사용자 인터페이스 밖!에 있으며, 여러 뷰가 접근해야하는 데이터일 경우 최고의 해결책.
 : Observable객체와 동일한 방법으로 선언되지만(ObservableObject프로토콜 준수, @Published 사용 등), Environment객체 바인딩은 @EnvironmentObject 프로퍼티 래퍼를 사용하여 SwiftUI 뷰 파일 내에 선언된다.
 : SceneDelegate.swift파일, 최신버전에선 App파일의 코드를 통해 뷰 화면이 앱에 추가될 때, Environment 객체 또한 초기화되어야 한다!....?
 */
