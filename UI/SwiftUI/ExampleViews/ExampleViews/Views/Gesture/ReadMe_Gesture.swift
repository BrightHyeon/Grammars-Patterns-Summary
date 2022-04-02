//
//  ReadMe_Gesture.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/04/02.
//

import SwiftUI

/*
 MARK: SwiftUI Gesture
 
 제스쳐(Gesture) - 터치스크린과 사용자 간의 interaction.
 -> 뷰의 영역 안에서 행해지는 gesture는 해당 뷰에 gesture recognizer를 추가하면 감지된다.
 
 -> 이런 제스쳐 인식기는 gesture() 수정자를 사용하여 뷰에 추가되며, 추가될 제스처 인식기가 수정자에 전달된다.
 
 -> 가장 간단한 형태에서 인식기는 하나 이상의 액션 콜백을 포함하며, 콜백은 일치하는 제스쳐가 뷰에서 감지될 때 실행되는 코드를 담는다.
 
 -> MARK: 제스처 작업을 할 때는 일반적으로 "제스처 인식기를 변수에 할당"하고 gesture() modifier에서 그 변수를 참조하는 것이 좋다.
 -> body선언부의 가독성 & 제스처의 재사용성 UP.
 
 <제스처의 종류>
 
 1. 드래그
 2. 탭
 -> .gesture() modifier 안에 TapGesture() 객체를 담고, .onEnded 콜백에 "제스처가 성공적으로 끝날 때 수행될 코드"를 담도록 구현한다.
 -> Ex) .gesture(
            TapGesture()
                .onEnded { _ in
                    print("Tapped")
                }
 
 3. 더블 탭
 4. 핀칭(확대 등)
 5. 로테이션
 6. 롱 프레스
 */


/*
 TODO: 롱 프레스 중에서도 실제 아이폰의 경우, 살짝누르고 바로 즉시 강하게 더 누르는 느낌을 주면 기다릴 필요없이 바로 반응한다! HOW?!
 */
