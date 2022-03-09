//Created by BrightHyeon 3.9(수).2022

import Foundation
import CoreGraphics

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
