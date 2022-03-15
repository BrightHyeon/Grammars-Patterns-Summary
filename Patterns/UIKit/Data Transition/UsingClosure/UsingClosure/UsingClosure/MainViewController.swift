//
//  ViewController.swift
//  UsingClosure
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .label
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        textField.layer.borderWidth = 0.3
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .black
        
        //TODO: textField에 shadow넣어보기. 잘안되네...!!!
//        textField.layer.shadowColor = UIColor.label.cgColor
//        textField.layer.shadowRadius = 7
//        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
//        textField.layer.shadowOpacity = 1
        
        return textField
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        
        button.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)
        
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.masksToBounds = false //내부의 요소들이 UIView밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것으로 false로 변경.
        button.layer.shadowOffset = CGSize(width: 4, height: 4)//중심기준, 그림자 위치.
        button.layer.shadowRadius = 7 //반경
        button.layer.shadowOpacity = 1 //alpha 값.
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupLayout()
    }
}

private extension MainViewController {
    @objc func tapPushButton() {
        let getVC = GetViewController()
        
        getVC.completionHandler = { text in //MARK: getVC의 completionHandler Closure를 정의하며 값 받기?
            self.textField.text = text
        } //closure의 실행부분을 여기서 구현.

        getVC.handler = { number in
            self.textField.text = String(number)
        }
        
        getVC.textField.text = self.textField.text //보내는건 그냥 이런식이 깔끔한듯함.
        
        self.navigationController?.pushViewController(getVC, animated: true)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Using Closure"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupLayout() {
        [
            textField,
            pushButton
        ].forEach { view.addSubview($0) }
    
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        pushButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(150)
        }
    }
}

//MARK: 동작원리
/*
 연결된 지점에서 getVC의 프로퍼티인 completionHandler를 통해 text값이 들어오면 받을 준비를 한다.
 getVC에서 적절한 시점에 text값을 전달인자로 넣어주면, 그것을 받아서 처리한다.
 사실상 return 타입은 안해줘도될것같다. 시도해보자. //MARK: 그렇다. return타입 위와같은 경우엔 필요없었다. 괜히 헷갈렸다. 그래도 어렵다. 정확한 논리를 아직 모르겠다.
 */

//반대로 A -> B로 가는 과정은 같은 방법으론 힘들수도있을 것같다는 생각이 든다. A에서 전달값을 줘도 B화면으로 갔을 땐, 코드가 초기화되는 것이기에 값을 전달받지 못할 수도 있다.
