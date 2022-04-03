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
 
 -> gesture() modifier에 nil값을 전달하면 제스처 인식기를 뷰에서 제거할 수 있다. .gesture(nil)
 
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
 -> let doubleTap = TapGesture(count: 2)
        .onEnded { _ in
            print("Double Tapped")
        }
 -> .gesture(doubleTap)
 
 4. 핀칭(확대 등)
 -> let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
        .onEnded { _ in
            print("Gesture Ended")
        }
 -> MARK: 위 구현체의 경우는 .onEnded 액션콜백을 사용하였기에 제스처가 끝난 후에만 메시지를 출력한다.
 
 -> MARK: Magnification()은 Magnification.Value 인스턴스를 가지는데, .onChanged 액션콜백을 이용하여 핀칭값이 바뀔 때마다 value를 원하는 변수에 할당할 수 있다.
 -> .onChanged 액션콜백은 제스처의 움직임이 지속되는동안 계속 호출되거든!!!
 
 5. 로테이션
 -> 책에 없더라;; ㅠㅠ
 
 6. 롱 프레스
 -> let longPress = LongPressGesture()
        .onEnded { _ in
            print("Long Pressed")
        }
 -> .gesture(longPress)
 
 -> custom version
 -> let customLongPress = LongPressGesture(minimumDuration: 10, maximumDistance: 25)
        .onEnded { _ in
            print("Custom Long Pressed")
        }
 -> .gesture(customLongPress)
 
 
 <액션콜백 종류>
 1. .onEnded 액션 콜백 -> 제스처가 성공적으로 끝날 때 수행될 코드를 담음.
 
 2. .onChanged 액션 콜백 -> 제스처가 처음 인식되었을 때 호출되며, 제스처가 끝날 때까지 제스처의 값이 변할 때마다 호출됨.
 -> TapGesture는 onChanged 액션콜백 지원하지않음!
 -> MARK: 이 콜백은 탭이나 롱프레스 제스처보단, 디바이스 화면에서 "움직이는 제스처"를 사용할 때 특히 유용하다! ex) 확대(핀칭)
 
 3. MARK: .updating 콜백 액션
 -> .onChanged과 거의 비슷하지만, @GestureState라는 이름의 특별한 프로퍼티래퍼를 사용한다는 점이 다르다.
 
 -> @GestureState는 표준 @State 프로퍼티 래퍼와 유사하지만, "제스처"와 함께 사용되도록 특별히 설계됨.
 -> MARK: 가장 큰 차이점 - 제스처가 끝나면 @GestureState는 자동으로 원래 상태 값으로 리셋된다.
 
 -> 따라서 updating콜백은 제스처를 하는 동안에만 필요한 임시 상태를 저장하는데 최적이다.
 
 -> 이 콜백이 호출될때마다 세 가지 인자가 전달된다.
 1) 제스처에 대한 정보가 담겨 있는 DragGesture.Value 인스턴스. -> MARK: 특히 유용! //꼭 DragGesture가 아니더라도, MagnificationGesture도 Value있음.
    -> DragGesture.Value의 프로퍼티들.
        -> location (CGPoint) - 드래그 제스처의 현재 위치
        -> predictedEndLocation (CGPoint) - 현재의 드래그 속도를 바탕으로 드래그를 멈추게 된다면 예상되는 최종 위치.
        -> MARK: predictedEndTranslation (CGSize) - 현재의 드래그 속도를 바탕으로 드래그를 멈추게 된다면 예상되는 최종 오프셋(offset). -> 날리기 구현가능할지도? @됨!
            -> TODO: 날리기 구현할 때 화면 안에서만 튕기도록 하는 법은?
        -> startLocation (CGPoint) - 드래그 제스처가 시작된 위치.
        -> time (Date) - 현재 드래그 이벤트가 발생한 타임스탬프
        -> MARK: translation (CGSize) - 드래그 제스처를 시작한 위치부터 현재 위치까지의 총 오프셋(offset).
 
 2) 제스처가 바인딩되어 있는 @GestureState프로퍼티에 대한 참조체.
 
 3) 제스처에 해당하는 애니메이션의 현재 상태를 담고 있는 Transaction 객체.
 
 -> 일반적으로, 드래그 제스쳐의 updating콜백은 DragGesture.Value 객체에서 translation값을 추출하여 @GestureState프로퍼티에 할당한다.
 ex) let drag = DragGesture()
        .updating($offset) { dragValue, state, transaction in
            state = dragValue.translation //state가 바로 @GestureState 프로퍼티에 대한 참조체값을 가지고 온 인자이다. 그러므로 이에 할당한다는 것은 offset변수에 할당한다는 것과 동일.
        }
 
 -> 이렇게 하면, 기존 이미지의 오프셋에서 현재 위치까지의 오프셋 값을 @GestureState변수에 할당할 수 있다. 이 CGSize 타입의 값을 이미지의 .offset() modifier에 할당하면, 이미지 이동이 구현된다.!!!
 
 -> summary -> 결국 어찌보면 아래의 두 구현체는 동작이 같다.!!!
 //MARK: Using @GestureState
 @GestureState private var offset1 = .zero
 
 let drag1 = DragGesture()
    .updating($offset1) { dragValue, state, transaction in
        state = dragValue.translation
    }
 
 //MARK: No Use @GestureState
 @State private var offset2 = .zero
 
 let drag2 = DragGesture()
    .onChanged { dragValue in
        self.offset2 = dragValue.translation
    }
    .onEnded {
        self.offset2 = .zero
    }
 */

/*
 <Gesture 구성하기>
 
 -> 일반적이진 않지만, 하나의 뷰에 여러 개의 제스처를 결합하여 적용할 수도 있다.
 -> 제스처들이 조합되면 동시에 감지하거나, 순차적으로 또는 배타적으로 감지되게 할 수 있다.
 
 <수정자 종류>
 1. simultaneously -> 두 개의 제스처가 "동시에" 감지되어야 해당 동작을 수행.
 
 2. sequenced -> 두번째 제스처가 감지되기 전에 첫번째 제스처가 완료되어야한다.
 
 3. exclusively -> 둘 중 하나의 제스처가 감지되면 다 감지된 것으로 간주된다. MARK: 이건 좀 쓸만해보임.
 */

/*
 TODO: 롱 프레스 중에서도 실제 아이폰의 경우, 살짝누르고 바로 즉시 강하게 더 누르는 느낌을 주면 기다릴 필요없이 바로 반응한다! HOW?!
 */


