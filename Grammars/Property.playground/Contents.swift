//Created by BrightHyeon 3.9(수).2022

import UIKit
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
 
 -> 즉 성공적으로 class의 instance를 생성하려면 저장프로퍼티를
 1)옵셔널로 선언하든지,
 2)사용자 정의 이니셜라이저를 사용하든지,
 3)lazy var사용하든지 !@!@!
 */
/* 상수 let은 instance가 완전히 생성되기 전에! 초기화해야하므로! 필요할 때서야 값을 할당하는 지연저장프로퍼티와는 맞지않습니다~!@(추후 값을 변경할 수가 없기 때문~!)
 따라서 지연 저장 프로퍼티는 lazy var 형태로만 사용하여 변수로 정의합니다~!
 */
//MARK: 그럼 "어떤 상황"에서 lazy var를 사용하는 것이 Best of Best인가?
//1. 주로 복잡한 클래스나 구조체를 구현할 때.
//2. 클래스 인스턴스의 저장프로퍼티로 다른 클래스 인스턴스나 구조체 인스턴스를 할당해야 할 때
class LazyExample {
    lazy var lazyLabel = UILabel() //UILabel클래스의 instance를 LazyExample클래스 인스턴스의 저장프로퍼티 lazyLabel에 저장.
} //이렇게 해주면 딱 쓰일 때 인스턴스들이 생성됨.
//지연저장프로퍼티를 잘 사용하면 불필요한 성능저하나 공간 낭비를 줄일 수 있다.
struct CoordinatePoint {
    var x: Int = 0
    var y: Int = 0
}
class Position {
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
let swiftistPosition: Position = Position(name: "Swiftist") //Position을 불러왔어도 lazy선언의 point변수의 CoordinatePoint는 생성안됨.
print(swiftistPosition.point) //이렇게 프로퍼티로 처음 접근할 때 point 프로퍼티의 CoordinatePoint가 생성됩니다.~!


//* 연산프로퍼티(Computed Properties)
//: 값을 저장한 것이 아니라 특정 연산을 실행한 결괏값을 의미함.
//: class, struct, enum 등에 사용가능.
//: 인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 접근자(getter)의 역할도 하고, 읽기전용.
//: 은닉화(private)된 내부의 프로퍼티 값을 간접적으로 설정하는 설정자(setter)의 역할을 할 수도 있습니다. 쓰기전용.

//MARK: "굳이 메서드를 두고 왜 연산 프로퍼티를 쓸까?"
//1. 인스턴스 외부에서 메서드를 통해 인스턴스 내부 값에 접근하려면 "메서드를 두 개(접근자, 설정자) 구현해야 함".
//2. 또한 이를 감수하고 메서드로 구현한다 해도 두 메서드가 "분산 구현되어 코드의 가독성이 나빠질 위험".

//* 다만, 연산프로퍼티는 get만 쓰는 것은 가능하지만, get없이 set만 쓰는 것은 불가능하다는 단점이 존재합니다.
//먼저, 메서드로 getter와 setter를 구현한 코드
struct CoordiPoint {
    var x: Int //저장프로퍼티
    var y: Int //저장프로퍼티
    
    //대칭점을 구하는 메서드 - 접근자(getter)
    //Self는 타입 자기 자신을 뜻함. *** = 자기자신의 타입을 나타내는 말 Self = CoordiPoint
    //Self 대신 CoordiPoint를 사용해도 됩니다. ***
    func oppositePoint() -> Self {
        return Self(x: -x, y: -y) //return값을 통해 읽어오기.
    }
    
    //대칭점을 설정하는 메서드 - 설정자(setter)
    //mutating 키워드 - 10.2.1절 참고.
    mutating func setOppositePoint(_ opposite: Self) { //그냥 좌표 설정 세팅해주기.
        x = -opposite.x
        y = -opposite.y
    }
}

var myPosition: CoordiPoint = CoordiPoint(x: 10, y: 20)
//현재좌표
print(myPosition) // 10, 20
//대칭좌표
print(myPosition.oppositePoint()) // -10, -20
//대칭좌표 새로설정
myPosition.setOppositePoint(CoordiPoint(x: 15, y: 10))
//새로 설정된 현재좌표
print(myPosition) // -15, -10
//* 위 코드 요약: getter와 setter 이름의 일관성을 유지하기 힘들며, 해당 포인트에 접근할 때와 설정할 때 사용되는 코드를 한 번에 읽기도 쉽지 않음.

//다음, 연산프로퍼티로 구현한 코드.
struct CoordiPoints {
    var x: Int
    var y: Int
    
    //대칭좌표
    var oppositePoint: Self { //연산프로퍼티
        //접근자
        get {
            return CoordiPoints(x: -x, y: -y) //getter의 코드가 한 줄이고, return타입이 프로퍼티타입과 같으면 return키워드 생략 가능.
        }
        //설정자
        set(opposite) { //매개변수로 원하는 이름을 소괄호 안에 명시해주면 set내부에서 전달받은 인자를 사용할 수 있음. 관용적으로 명시안해줘도 블럭 안에서 newValue키워드 사용가능
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var myPositions: CoordiPoints = CoordiPoints(x: 10, y: 20)
//현재좌표
print(myPositions) // 10, 20
//대칭좌표
print(myPositions.oppositePoint) // -10, -20
//대칭좌표를 새로설정
myPositions.oppositePoint = CoordiPoints(x: 15, y: 10) //setter
//새로 설정된 현재좌표
print(myPositions) // -15, -10

//그리고, 읽기쓰기 둘다 하는 프로퍼티면 get, set둘다 구현해야하지만, 읽기전용일 경우 get블럭을 생략해도됩니다.

//* 프로퍼티 감시자(Property Observers)
//: 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 작업을 실행합니다.
//: 저장프로퍼티에 적용할 수 있으며, 부모클래스로부터 상속받을 수 있습니다.

class Account {
    var credit: Int = 0 {
        willSet {
            print("바뀔 예정")
        }
        didSet {
            print("바뀜")
        }
    }
}
let myAccount: Account = Account()
myAccount.credit = 1000 //instace의 property값을 변경한거지 무엇의 instance인지 바꾼것이 아니기에 let키워드도 쌉가능.

//* 전역변수, 상수 : 지연 저장프로퍼티의 특성처럼 처음 접근할 때 최초로 연산이 이뤄집니다. 따라서 굳이 lazy키워드를 사용하여 연산을 늦출 필요가 없습니다.
//* 반대로 지역변수 및 지역상수는 절대로 지연 연산되지 않습니다.


//MARK: 타입프로퍼티(Type Properties) - static
//: 저장, 연산 프로퍼티는 "특정 타입의 인스턴스"에 사용되는 것을 뜻하지만,
//: "특정타입"에 사용되는 프로퍼티도 존재합니다. 이를 Type Property라 합니다.

/*
 //MARK: important type property
 이제까지의 프로퍼티는 모두 타입을 정의한 후 해당 타입의 "인스턴스가 생성되었을 때" 사용할 수 있는 인스턴스 프로퍼티입니다.
 인스턴스 프로퍼티는 "인스턴스를 새로 생성할 때마다" 초깃값에 해당하는 값이 프로퍼티의 값이 되고, "인스턴스마다 다른 값을 지닐 수 있습니다."
 
 각각의 인스턴스가 아닌 "타입 자체"에 속하는 프로퍼티를 타입 프로퍼티라 합니다.
 "*** instance의 생성 여부와 상관없이 타입프로퍼티의 값은 하나이며, 그 타입의 모든 인스턴스가 공통으로 사용하는 값, 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수 등을 정의할 때 유용합니다."
 
 - 저장타입프로퍼티: 변수 또는 상수로 선언가능. 반드시 초깃값을 설정해주어야하며 "지연연산"됨. 지연저장프로퍼티(lazy var)와는 다르게 다중 스레드환경일지라도 단 한번!만 초기화됨.
 - 연산타입프로퍼티: 변수로만 선언가능.
 */
//MARK: 타입 프로퍼티와 인스턴스 프로퍼티
class AClass {
    
    //저장타입프로퍼티
    static var typeProperty: Int = 0
    
    //저장인스턴스프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    //연산타입프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
}

let aClass: AClass = AClass()
print(aClass.instanceProperty)
aClass.instanceProperty = 100
print(aClass.instanceProperty)
print(AClass.typeProperty)
AClass.typeComputedProperty = 100
AClass.typeProperty

let bClass: AClass = AClass()
bClass.instanceProperty = 200
AClass.typeProperty

//타입프로퍼티는 인스턴스를 생성하지 않고도 사용이 가능. 타입에 해당하는 값. 그래서 타입 이름만으로도 프로퍼티를 사용할 수 있음.

//keypoint summary
/*
 1. 연산프로퍼티는 자신의 값이 없다.
 2. getter, setter는 연산프로퍼티에서 구현하는 블럭이다.
 3. 저장프로퍼티는 초깃값이 있을수도 없을수도있는데, 클래스의 경우 초깃값을 지정하거나, 옵셔널 처리하거나, 사용자 지정 이니셜라이저를 해주거나, lazy var 키워드 사용.
 4. lazy var를 사용하게 되면, 초깃값이 있는 듯 보이긴하지만, 실제값은 실제 호출이 되야 들어온다.
 5. 전역변수나 전역상수는 lazy키워드 안써줘도 알아서 자기가 필요한 시점에 초기화된다.
 6. 저장 타입 프로퍼티는 반드시 초깃값을 설정해줘야 하며 lazy키워드 없이 알아서 지연연산되고, lazy와는 다르게 다중스레드환경에서도 단 한번만 초기화됩니다.
 7. 연산 타입 프로퍼티는 반드시 변수로 선언해야하고, 값이 없습니다.
 8. 타입프로퍼티는 타입자체로 접근합니다. 인스턴스 생성이 필요없습니다.
 9. 타입프로퍼티는 그 클래스의 인스턴스 모두가 공유하는 값입니다.
 
 참고: 내가 여러 프로젝트를 할 때 사용하던 private lazy var a: UILabel = { ... return label }() 이 get생략한건줄알았는데 겁나 착각이였다.
 애초에 get블럭을 쓰는 연산프로퍼티는 값을 가지지않는다~!!!. 아마 그냥 UILabel값을 반환하는 클로저를 넣은 듯하다~!
 */
