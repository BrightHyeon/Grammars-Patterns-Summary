//
//  ViewController.swift
//  NavBarSettings
//
//  Created by HyeonSoo Kim on 2022/03/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
    }

}

//각종 setup을 위한 메서드는 private하게 하는 습관.
private extension ViewController {
    func setupNavBar() {
        //@MainActor class UINavigationBar : UIView
        
        
        
        //MARK: - Center title 설정
        title = "title" //self.navigationItem.title = "title" =>> title만 써도됨.
        navigationController?.navigationBar.prefersLargeTitles = true

        
        
        //MARK: - Custom한 Center title 설정
        /*navigationItem.titleView = UIView() -> class를 상속하는 UIView 객체들이 올 수 있음.
        //UILabel, UIButton, UIView 등등. 이를 이용하여 title부분을 다채롭게 나타낼 수 있고, 특정 Action을 부여할 수도 있으며, font설정도 가능.*/
        //예시)
//        let barCenterButton: UIButton = {
//            let button = UIButton()
//            button.setImage(UIImage(systemName: "calendar"), for: .normal)
//            button.setTitle("title", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
//            return button
//        }()
//        self.navigationItem.titleView = barCenterButton
        
        
        
        //MARK: - left & right BarButtonItem 설정 (title, image따위 넣을 수 있음.)
        // UIBarButtonItem(/*원하는 스타일대로 구현*/)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"), //image를 nil로 해놨다가, 나타나게 하고 싶은 시점에 값넣어도됨. 옵셔널로되어있으니.
            style: .plain,
            target: self,
            action: #selector(tapLeftButton)
        ) //image를 넣을수도,
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "D-day",
            style: .plain,
            target: self,
            action: nil
        ) //title을 넣을수도 있음.
        
        
        //MARK: - 각종 Color설정.
        
        //MARK: tintColor 설정
        //이와같이 각각 넣을 수도 있고,
        navigationItem.leftBarButtonItem?.tintColor = .black
        //forEach써서 한 번에 바꿀 수도 있고,
//        [navigationItem.leftBarButtonItem,
//         navigationItem.rightBarButtonItem].forEach { $0?.tintColor = .black }
        //혹은 SceneDelegate에서 window의 tintColor를 설정함으로써 tintColor로 색을 조정하는 window의 모든 요소들의 tint색을 기본값으로 설정할 수도 있음.
        
        //MARK: NavBar backgroundColor 설정 (***어려움 주의***)
        //단순히 이렇게 설정하면, bar의 직사각형 색만 바뀌고, 최상단의 색은 view의 backgroundColor임.
//        navigationController?.navigationBar.backgroundColor = .orange
        // .clear 색상 : 투명색.
        
        //MARK: barTintColor
        //Apple 공식문서에 따르면 NavBar의 배경색으로 적용되는 색이라하는데 아무런 반응이 없음.
        navigationController?.navigationBar.barTintColor = .blue
        
        //MARK: 동작관련
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.hidesBarsOnTap = true
        
        navigationItem.backButtonDisplayMode = .default
        //.default: 이전스택의 제목이 돌아가는 버튼의 이름.
        //.generic: back(버튼이름)
        //.minimal: < (화살표만 남음)
        
        navigationItem.largeTitleDisplayMode = .automatic //prefersLargeTitles이 false면 아무 효과없는 설정이됨.
        //.automatic: default값
        //.always: 항상 large ===> 즉, large스타일을 원하는 시점에 never하거나 always를 사용하여 변화를 주면됨.
        //.never: 항상 small
        //이설정을 해도 스크롤 내리면 자동으로 작은 title로 되긴함.
    }
    
    @objc func tapLeftButton() {
        let vc = ForTestViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//TODO: UIBarButtonItem의 title UIFont설정. -> 좀 어려움. 추후 도전.
//TODO: isTranslucent의 동작과정
//: NavBar는 기본적으로 반투명하다고함. 이 프로퍼티를 false로 변경함으로써 불투명하게 만든다고함.
//: 기타 색들을 적용해도 이 프로퍼티가 true면 기본적으로 반투명상태임.
//TODO: 기타
//    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//    navigationController?.navigationBar.shadowImage = UIImage()
//TODO: UIBlurEffect
//View hierarchy에서 거슬려서 찾아본건데 UIVisualEffect를 상속받는 클래스이다.
//이미지를 흐리게 보여주는데, 습기찬 창문에 손가락으로 글씨써주듯이 나타나는 이펙트를 구현하기 좋을 것 같아서 정리해두기.

//TODO: NavBar Background 해결
//NavBar를 자꾸 막는 놈이 있어서 이를 해결하려하는데, hierarchy를 보면됨. 앞에서 막고있는 놈도있고, 뒤에있는 놈도있고, 암튼 알아보자~!
