//<What is a Delegate & Delegate Pattern?>

/*
 //MARK: In Apple Documents,
 delegate는 위임자. 즉 앱 객체의 대리인이다.
 
 //MARK: Declaration
 unowned(unsafe) var delegate: UIApplicationDelegate? { get set }
 
 //MARK: Discussion
모든 앱에는 앱 관련 메시지에 응답하려면 앱 delegate 객체가 있어야 합니다. 예를 들어, 앱은 앱이 launching을 완료하고 foreground 또는 background 실행 상태가 변경될 때 delegate(대리인)에게 알립니다. 마찬가지로, 시스템에서 오는 앱 관련 메시지는 종종 처리를 위해 앱 대리인(delegate)에게 라우팅됩니다. Xcode는 모든 앱에 대한 초기 앱 대리인을 제공하며 나중에 이 대리자를 변경할 필요가 없습니다.

 대리인은 UIApplicationDelegate 공식 프로토콜을 채택해야 한다.
 
 -> 공식 문서의 설명을 보면 모든 앱은 기본적으로 delegate 즉, 위임자 or 대리인으로 불리는 객체가 있습니다. 앱 관련 동작들을 위임받아 대신 처리해주는 것이죠.
 -> 우리가 UIKit프로젝트를 생성했을 때 기본적으로 있는 AppDelegate클래스도 UIApplicationDelegate 프로토콜을 채택하고, 이런 대리인들을 통해 처리하는 모습을 볼 수 있습니다.
 */

//이런 형태로 위임자를 생성하고, 임무를 위임하는 것이 바로 delegate 패턴입니다.

//delegate를 알려면 먼저 "프로토콜"을 알아야합니다. delegate가 프로토콜로 구현이 되기 때문이죠.
//프로토콜은 그냥 서로간의 "약속"이라고 생각하면됩니다.
//그리고 프로토콜 상에선 이 약속을 "정의"만 하고, "구현"은 이 프로토콜을 채택하는 곳에서 구현해줍니다.

//Swift에서 기존의 button, textField, label등등 객체들은 고유의 특징이 있습니다.

//델리게이트 패턴은 쉽게 말해, 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야 할 일 중 일부를 다른 객체에 넘기는 것을 뜻합니다.

//사용자 정의 delegate를 구현하여 각종 data를 전달할 수도 있고, 기존에 있는 객체의 delegate들을 이용하여 여러 기능을 구현할 수도 있습니다.

//우리는 흔히 delegate프로토콜을 채택한 후, tableView.delegate = self란 코드를 볼 수 있습니다.
/*
 이 과정은 "위임자가 누구인지 알려주는 과정"입니다.
 
 "tableView의 뒷바라지는 내가 할게"라는 의미입니다. 여기서 "나"는 self가 나타내는 현재 class등이 되겠죠. 만약 class가 class MainViewController: UIViewController {}라면 여기서 이 MainViewController가 self입니다.
 
 여기서 MainViewController가 tableView에게 말해주는 것입니다. "너한테 이벤트가 발생하면 프로토콜에 따라서 tableView너한테 응답을 줄게"
 
 그 후 프로토콜의 특정 메소드를 구현하고, 그 함수안에 하고싶은 일을 구현하면된답니다.
 */

//MARK: - Summary
/*
 if 객체가 UITextField일때,
 
 TextField에 입력된 값을 다른 위치의 Label의 text값으로 넣고 싶다고 가정해봅시다.
 
 TextField 왈> ViewController야, 내가 나한테 입력된 값을 label한테 보내고픈데 어떻게 좀 해줘.
 
 ViewController 왈> Ok. 프로토콜 채택하고, 적당한 메서드 찾아볼게.
 
 1) UITextFieldDelegate 채택.
 2) textField.delegate = self를 적당한 시점에 선언. (내가 textField친구의 대리자(delegate)야~~)
 3) 프로토콜의 메서드인 textFieldShouldReturn(_ textField: UITextField)를 선언.
 4) 함수 안에 TextField의 값을 Label의 text값에 넣어주는 코드를 구현.
 
 ViewController 왈> 야~ 다됐엉~
 TextField 왈> 땡큐~~
 
 요런~ 느낌입니다~!!!
 */

//비슷한 논리로, 사용자 정의 delegate도 만들어내는 것임.


