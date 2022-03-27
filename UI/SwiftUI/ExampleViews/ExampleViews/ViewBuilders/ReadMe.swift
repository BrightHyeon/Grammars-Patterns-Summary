//
//  ReadMe.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/25.
//

//What is a @ViewBuilder?

/*
 MARK: - # ViewBuilder
 정의: Closure에서 View를 구성하는 custom parameter attribute
      "Closure에서 (Child) View를 구성한다."
 
 - in Swift
 var body: some View {
     HStack {
        VStack {
            Button(action: myaction) {
                ...
                Text(...)
                    ...
                    ...
            }
        }
     }
 }
 
 - 보통, 위와 같은 형태지?! 이런 HStack, VStack을 보면 Closure안에!!! View들을 넣어주고 있음.
 
 MARK: # HStack의 생성자
 @frozen public struct HStack<Content> : View where Content : View {
 
     @inlinable public init(alignment: VerticalAlignment = .center,
                            spacing: CGFloat? = nil,
                            @ViewBuilder content: () -> Content)
 
 ...
 }
 
 -> @ViewBuilder content 파라미터(Closure타입)가 있는 모습!!!
 
 또한 View프로토콜의 body역시 @ViewBuilder로 설정되어있다. 결국 우리가 선언하고있는 작업들은 모두 @ViewBuilder를 통해서 이뤄지고 있는 모습.
 
 * 그러니! Custom한 H,VStack등을 만들때도 @ViewBuilder를 사용해야하는거닷!
 
 MARK: # Content
 - 단순히 생각하면 쉽다. 그냥 Generic으로 지정한 타입이다.
 - 본래 있는 HStack 등 역시 <Content> : View where Content : View를 통해, 정의되어있듯이 Custom도 유사한 방식으로 정의하는 것 뿐~!
 
 - 그럼 이제 실전을 통해 파악해보자! -> Go to MyVStack SwiftUI file.
 
 */


/*
 MARK: - @ViewBuilder 관련 추가 설명.
 
 1) AView : 프로퍼티로서의 뷰. 프로퍼티에 뷰를 할당할 수도 있다.
 !!! - 하지만, 이는 HStack이 Text들을 묶어주는 컨테이너 역할을 하기에 묶어줄 수 있는 것이고,
        일반적으로 HStack없이 Text만을 나열한다면 컴파일 에러가 발생할 것이다.
 
 2) BView : @뷰빌더 사용하기. HStack은 애초에 @뷰빌더로 정의되어있기에 가능했던 것.
            그러므로 HStack없이도 @뷰빌더 속성을 명시해준다면 뷰들을 묶는 것이 가능해진다.
            주의: Computed Property여야 하기에 let은 안됌. var만 가능!
 
 3) body 프로퍼티의 경우, Stack으로 묶어주지 안하도, 기본적으로 View요소들을 연산할 수 있다. 암묵적으로 body는 @ViewBuilder속성으로 컴파일되기 때문~!!!
 */

import SwiftUI

struct AView: View {
    
    let Aproperty: some View =
    HStack {
        Text("aaa")
        Text("aaa")
        Text("aaa")
        Text("aaa")
    }
    
    var body: some View {
        Aproperty
    }
}

struct BView: View {
    
    @ViewBuilder
    var Bproperty: some View {
        Text("bbb")
        Text("bbb")
        Text("bbb")
        Text("bbb")
    }
    
    var body: some View {
        Bproperty
    }
}

struct CView: View {
    
    var body: some View {
        Text("ccc")
        Text("ccc")
        Text("ccc")
        Text("ccc")
        Image(systemName: "star")
    }
}
