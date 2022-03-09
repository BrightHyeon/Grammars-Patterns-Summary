//Created by BrightHyeon 3.9(수).2022

import Foundation
import CoreGraphics

//Restudy difficult Grammer.

//It would be even better if you completed this study by March 14th.

//You'd better check real codes in your projects.

//Cheer up~!

/*
 <Chapter-List>
 1. enum (열거형)
 2. 값 binding (457p)
 3. class, struct (특히 값과 참조 내용)
 4. closure (+ 탈출 클로저), 함수
 5. [weak self]
 6. generic (제네릭)
 7. instance, object (인스턴스, 객체 개념)
 8. memory (메모리에 올라오는 시점, 사라지는 시점 등)
 9. AppLifeCycle
 10. Delegate pattern
 11. NotificationCenter
 12. init과 deinit, override init 등. (각 UI객체의 init들 등.)
 13. 프로퍼티 옆 { closure? }
 14. 접근제어 public, open, internal, fileprivate, private 등.
 15. protocol
 16. ARC
 17. 오류처리
 */

//MARK: - enum (열거형) //흐름제어 파트도 참고하길. 열거형 얘기 나온다고함.

//* In what cases? keyword: limit
//1. 제한된 선택지를 주고싶을 때, 2. 정해진 값 외에는 입력받고 싶지않을 때, 3. 예상된 입력 값이 한정되어 있을 때.
enum School {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
} //예시처럼 보통 enum안의 값들은 서로 연관되어있는 선택지들이 열거되어있다. 각 항목은 "그 자체가 고유의 값." (타입은 속해있는 enum)

//열거형 변수 생성 및 값 변경
var highestEducationLevel: School = .high
highestEducationLevel = .university //정해진 case안에서 쉽게 값변경 가능.
print(highestEducationLevel) //각 항목은 "그 자체가 고유의 값"이기에 print를 찍어보면 "university"가 출력!
print(type(of: highestEducationLevel)) //School 타입.

//* 원시값(rawValue)
//enum의 각 case는 그 자체로도 하나의 값이지만 항목의 "rawValue"도 가질 수 있습니다. (즉 고유값 != 원시값)
//실제 value를 가질 때는 rawValue라는 형태로 (숫자, 문자 타입 등의) 실제 value를 가질 수도 있음.
//특정 타입으로 지정된 rawValue를 가지고 싶으면 반!드!시! enum 이름 우측에 타입을 명시해주면 됩니다.

enum School2: String { //타입 명시; String
    case primary = "유치원" //String타입의 "유치원"이란 문자열을 rawValue로 가지는 primary case.
    case elementary = "초등학교"
    case middle
    case high = "고등학교"
    case college
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel2: School2 = School2.university
print(highestEducationLevel2) // "university"
print(type(of: highestEducationLevel2)) //School 타입.
print(highestEducationLevel2.rawValue) // "대학교"
print(type(of: highestEducationLevel2.rawValue)) //String 타입.

let withoutRawValueCase: School2 = .college
print(withoutRawValueCase.rawValue) // "college" - String타입~!

//원시값 정리
//rawValue를 사용하고자한다면 반드시! enum열거형 우측에 rawValue타입을 명시해주어야한다~! -> 타입 명시 없을 경우, .rawValue 자체가 없음~!
//case에 rawValue 실제값을 입력해주지않더라도, enum옆에 타입 명시만 되어있을 경우 rawValue를 출력할 수 있다. enum의 rawValue 타입이 String선언일 경우 그 case항목의 이름이 String으로 출력되고, rawValue타입이 Int일 경우 그 case항목의 index가 Int로 출력된다. (print(변수.rawValue)를 했을 경우.)
//case의 타입을 출력하는 경우, 그 case의 타입은 속해있는 enum이다.

//원시값 정보를 통해 case를 저장할 수도 있습니다. 다만 이때 그 case항목이 rawValue를 가지고있지않을수도 있기때문에 옵셔널값으로 생성됩니다.
let primary = School2(rawValue: "유치원")
print(type(of: primary!)) //강제추출 !
let middle = School2(rawValue: "중학교")
print(middle) //nil반환. 열거형 School2의 middle 항목은 원시값이 없기 때문~!

//* 연관값(associatedValues)
//열거형 내의 case는 자신과 "연관"된 값을 가질 수 있습니다.
//이는 각 항목 옆에 소괄호()로 묶어 표현할 수 있습니다.
//항목별로 연관값을 가질수도 안가질수도있습니다. 특정 case가 연관값이 있다고 해서 다른 case도 연관값을 가질 필요는 없다는 뜻.
enum MainDish { //: ??!!Int, : String. 이런식으로 원시타입가지려니까 오류나네? ERROR: enum case cannot have a raw value if the enum does not have a raw type.
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}
//TODO: - 연관값과 원시값(rawValue)은 공존할 수 없는가?

var dinner: MainDish = .pasta(taste: "크림") //크림파스타
print(dinner) //"pasta(taste: "크림")"
dinner = .pizza(dough: "치즈크러스트", topping: "불고기") //불고기 치즈크러스트 피자
print(dinner)
dinner = .chicken(withSauce: true) //양념 통닭
print(dinner)
dinner = .rice //밥
print(dinner) //"rice"

//만약 case의 연관값이 한정적이라면 연관값으로 들어갈 값 역시 열거형형태로 나타낼 수도 있습니다.
enum PastaTaste: Int {
    case cream, tomato //<- 아래형태랑 같은 뜻임. 한 줄로 써도됨.
    //case cream
    //case tomato
}
enum PizzaDough {
    case cheeseCrust, thin, original
}
enum PizzaTopping {
    case pepperoni, cheese, bacon
}
//이런식으로 제한을 줄 수 있습니다.
enum MainDish2 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner2: MainDish2 = .pasta(taste: .tomato)
print(dinner2)

//* 열거형 항목 순회
//때때로 열거형의 모든 케이스를 알아야 할 때가 있음.
//그럴경우 열거형 우측에 CaseIterable프로토콜을 채택하고, allCases프로퍼티를 이용해 호출해줄 수 있음. ;iterable: 반복가능한.
enum School3: CaseIterable { //연관값 가지려하면, 프로토콜 준수하지않는다는 ERROR발생.
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}
//TODO: - 연관값과 CaseIterable은 공존할 수 없는가?

let allCases: [School3] = School3.allCases
print(allCases) //[School3.primary, School3.elementary, ... , Schoo3.graduate]
print(type(of: allCases)) //Array<School3>

//타입 명시를 통해 원시값을 부여할수도 있습니다.
enum School4: String, CaseIterable { //String 타입 명시(원시값 용) + CaseIterable(allCases확인가능하도록.)
    case primary = "유치원"
    case elementary = "초등학교"
    case middle
    case high = "고등학교"
    case college
    case university = "대학교"
    case graduate = "대학원"
}
let allCases2: [School4] = School4.allCases
print(allCases)
let graduate = School4.graduate
print(graduate.rawValue)

//* 복잡한 열거형에서의 CaseIterable.
//* available
//* 연관값을 갖는 열거형의 항복 순회.

//* Tips
//- Have a good relationship with Switch
//- Optional is implemented(구현) as an enum type.







//MARK: - class
//class는 객체가 만들어지기 위한 "청사진"으로 비유할 수 있음.
//class는 실제 메모리에 객체를 할당하여 인스턴스를 만들기 위한 일종의 설계코드입니다.
//class에 구현된 코드대로 실제로 객체가 메모리에 올라가 호라동하게 됩니다.
//class에 정의된 모양대로 객체가 생성되고 객체 간의 메시지를 통해 프로그램의 각 명령이 실행됩니다.






//MARK: - instance, object

//* object(객체): class의 instance. 객체는 자신 고유의 속성이 있으며 클래스에서 정의한 행위를 할 수 있습니다.
// object != instance
// object == class's instance
// struct, enum의 instance등은 객체가 아닙니다.
// 즉, instace의미 안에 object의미가 포함되긴하나, 같은 뜻은 아닙니다.

//* instance(인스턴스): 클래스, 구조체, 열거형 등이 실제로 "메모리에 할당"되어 동작하는 모양을 갖춘 형태.
class SomeClass {
    var someProperty: Any = 1
    func someMethod() {
    }
}

//SomeClass라는 이름의 class의 intializer를 호출하여 상수에 할당.
//클래스의 이니셜라이저를 통해 메모리에 할당되고 초기화한 객체를 우리는 인스턴스라고 부릅니다.
let someInstance: SomeClass = SomeClass() // () <- 이 소괄호를 쓴 것이 바로 이니셜라이저(init)를 호출한 행위인 것입니다~!!!
someInstance.someProperty = 100 //인스턴스의 프로퍼티에 값을 할당할 수도 있고,
someInstance.someMethod() //메서드를 호출할 수도 있습니다.
print(someInstance.someProperty) //someInstance에서 someProperty의 값을 변경했어도,

let someInstance2: SomeClass = SomeClass()
print(someInstance2.someProperty) //someInstance2의 someProperty의 값이 변경되는 것은 아닌가보다. //TODO: - 그럼 참조타입은 정확히 어떻게 동작하는가?




//MARK: - 함수
//* swift의 함수는 "일급 객체"이다. 이 개념 다시 확실히 잡자 ~!
//1. 전달인자로 전달할 수 있습니다.
func doSomething() {
    print("do something~!")
}
func doAnotherThing() {
    print("do another thing~!")
}
func excute(tasks: [() -> Void]) { //* 매개변수로 특정타입의 함수의 배열을 받는다고 선언.
    for task in tasks {
        task()
    }
}
excute(tasks: [doSomething, doAnotherThing]) //* 전달인자로 함수를 전달.
//() -> Void //TODO: - 이거 클로저맞나?
//해석하자면 "매개변수와 반환값이 없는 함수 타입(type)"을 말하는 것입니다.

//2. 동적프로퍼티 할당이 가능합니다.


//3. 변수나 데이터 구조 안에 담을 수 있습니다.
//예를 들어 정제되지않은 data를 Decoding하여 return시키는 함수 getData()가 있다고 가정했을 때,
//var myData = getData()를 통해 프로퍼티에 할당할 수 있습니다.
//이렇게 하면 받아오는 data가 달라짐에 따라 변수 myData에 할당되어있는 data도 호출된 시기에 따라 변할 것입니다.

//4. 반환값으로 사용할 수 있습니다.
func sum(first: Int) -> ((Int) -> Int) { //"Int값을 받고 'Int값을 받아 Int값을 반환하는 함수'를 반환하는 함수 sum(first:)"
    return { second in //여기서 second는 반환되는 함수의 매개변수이름을 설정한 것이라 생각하면된다. (_ second: Int) 정도로 생각하면 될 듯!
        first + second
    }
}
sum(first: 10)(5) //첫번째 괄호는 sum함수에 수를 전달한거고, 두번째 괄호에는 반환되는 함수의 전달인자로 수를 전달한 것.

//한번 더?
func stringSum(_ first: String) -> ((String) -> String) {
    return { second in
        first + second
    }
}
stringSum("Bright")("Hyeon")

//긴 버전으로 진짜 한번 더?
func intSum(first: Int) -> ((Int) -> ((Int) -> Int)) { //이런 기법을 Currying(커링) 기법이라 함: 여러개의 매개변수를 갖는 함수를 매개변수 하나를 갖는 함수의 나열로 표현하는 방법~!
    { second in
        { third in
            first + second + third
        }
    }
} //참고로 반환하고자하는 값이 위처럼 확실한 경우 return 값을 생략할 수 있다. return에 대한 것 이외의 요소가 있을 때는 분리해줘야하기에 return 써주어야하지만.
intSum(first: 2)(4)(6)

//5. 할당할 때 사용된 이름과 관계없이 고유한 객체로 구별할 수 있습니다.





//MARK: - init
//init: 이니셜라이저를 뜻한다.

//instance, object 챕터 안에서 정의한 SomeClass 클래스.
//TODO: - 따로 분류할 땐 class새로 써주기.
let initSomeClass: SomeClass = SomeClass() // () <- 이 소괄호를 쓴 것이 바로 이니셜라이저(init)를 호출한 것. 이렇게 이니셜라이저를 통해 메모리에 할당(초기화)됨.




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




//MARK: - Method
//* 특정 타입에 관련된 함수를 뜻함.
