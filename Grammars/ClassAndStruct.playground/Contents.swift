//Created by BrightHyeon 3.9(수).2022

import UIKit
import CoreGraphics

//MARK: Class, Struct

//아무리 봐도봐도 써봐도써봐도 이해가 어려운 둘의 차이.
//struct의 인스턴스는 값 타입이다. //그 외 스위프트의 데이터 타입과 열거형은 모두 값 타입이다.
//class의 인스턴스는 참조 타입이다.

//구조체는 인스턴스를 let으로 선언하면 프로퍼티 값 바꿀 수 없음.
struct PersonS {
    var name: String
}
let personS: PersonS = PersonS(name: "김현수")
//personS.name = "Swiftist" //변경불가능. why: 그 자체가 값타입이니까~!

class PersonC {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
let personC: PersonC = PersonC(name: "김현수")
personC.name = "Swiftist"
print(personC.name) //변경가능. why: 참조타입이니까~!

//인스턴스 내부 저장프로퍼티가 상수면 변경못하는 건 당연히 둘다 해당하고.

//클래스의 instance는 참조 타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제됩니다.
//이것을 소멸이라 하고, 소멸되기 직전 deinit이라는 메서드가 호출됩니다.
