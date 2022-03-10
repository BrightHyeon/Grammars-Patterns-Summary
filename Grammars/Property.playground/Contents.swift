//Created by BrightHyeon 3.9(수).2022

import Foundation
import CoreGraphics

 //MARK: - Property & Property Observers
//* class, struct, enum 등에 관련된 값을 뜻함.
//* 변수나 상수 등이 어떤 목적으로 쓰이느냐, 어디에서 어떻게 쓰이느냐에 따라 용어가 좀 달라질 뿐. 같은 형태.

//* 저장프로퍼티(Stored Properties)
//: instance의 변수 또는 상수를 의미함. : class, struct에서만 사용가능.
//* 저장프로퍼티를 정의할 때 프로퍼티 기본값과 초깃값을 지정해줄 수 있습니다. //TODO: - 기본값 관련 내용은 11장. 인스턴스 생성 및 소멸에서 다룸.

//* 구조체 vs 클래스 저장프로퍼티
//: 구조체는 저장프로퍼티가 옵셔널이 아니더라도, 저장프로퍼티를 모두 포함하는 initializer를 자동으로 생성합니다. 따라서 기본값이 없더라도, 옵셔널선언을 안해줘도됩니다.
//: 반면 클래스는 옵셔널이 아닌 이상 프로퍼티 기본값을 지정해주거나 사용자 정의 initializer를 통해 반드시 초기화해주어야 합니다.
struct PersonS {
    let name: String //자동으로 이니셜라이즈.
    let height: Double
    let isMale: Bool
}
let personS: PersonS = PersonS(name: "김현수", height: 177.0, isMale: true) //기본적으로 "저장프로퍼티"를 매개변수로 갖는 이니셜라이저가 있음.
print(personS) //PersonS(name: "김현수", height: 177.0, isMale: true)

class PersonC {
    let name: String //사용자지정 init해주거나, ?(옵셔널)로 처리한 후 추후에 바인딩해야함. 혹은 초깃값을 지정해주거나~!
    let height: Double
    let isMale: Bool
    
    init(name: String, height: Double, isMale: Bool) {
        self.name = name
        self.height = height
        self.isMale = isMale
    }
}
let personC: PersonC = PersonC(name: "김현수", height: 177.0, isMale: true)
print(personC) //__lldb_expr_20.PersonC //TODO: - why? like this? //struct는 통째로도 가능하나 얘는 안되네.
print(personC.name) //"김현수"

//구조체; 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없음. 또한 이니셜라이저를 호출하면 값을 변경가능.(물론 var 변수일때.)
struct PersonHaveDefaultValue {
    let x: Int = 1
    var y: Int = 2
}
let defaultValue: PersonHaveDefaultValue = PersonHaveDefaultValue()
print(defaultValue.x)
let tryChangeValue: PersonHaveDefaultValue = PersonHaveDefaultValue(y: 4) //var변수인 y값만 지정가능.
print(tryChangeValue)

//MARK: **지연저장프로퍼티(Lazy Stored Properties)
/* instance를 생성할 때 property에 값이 필요없다면 property를 옵셔널로 선언해줄 수 있습니다.
 하지만 그것과는 "조금 다른 용도"로 필요할 때 값이 할당되는 지연저장프로퍼티가 있습니다.
 지연 저장프로퍼티는 "호출"이 있어야 값을 초기화하며, 이때 lazy 키워드를 사용합니다~!
 
 -> 즉 성공적으로 instance를 생성하려면 저장프로퍼티를
 1)옵셔널로 선언하든지,
 2)사용자 정의 이니셜라이저를 사용하든지,
 3)lazy var사용하든지 !@!@!
 
 */
/* 상수 let은 instance가 완전히 생성되기 전에! 초기화해야하므로! 필요할 때서야 값을 할당하는 지연저장프로퍼티와는 맞지않습니다~!@(추후 값을 변경할 수가 없기 때문~!)
 따라서 지연 저장 프로퍼티는 lazy var 형태로만 사용하여 변수로 정의합니다~!
 */




//* 연산프로퍼티(Computed Properties)
//: 값을 저장한 것이 아니라 특정 연산을 실행한 결괏값을 의미함.
//: class, struct, enum 등에 사용가능.

//* 타입프로퍼티(Type Properties) - static
//: 저장, 연산 프로퍼티는 "특정 타입의 인스턴스"에 사용되는 것을 뜻하지만,
//: "특정타입"에 사용되는 프로퍼티도 존재합니다. 이를 Type Property라 합니다.


//* 프로퍼티 감시자(Property Observers)
//: 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 작업을 실행합니다.
//: 저장프로퍼티에 적용할 수 있으며, 부모클래스로부터 상속받을 수 있습니다.
