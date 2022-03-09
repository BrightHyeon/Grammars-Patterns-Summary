//Created by BrightHyeon 3.9(수).2022

import Foundation
import CoreGraphics

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
