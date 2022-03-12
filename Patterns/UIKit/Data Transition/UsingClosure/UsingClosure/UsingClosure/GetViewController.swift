//
//  GetViewController.swift
//  UsingClosure
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class GetViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .label
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 3
        
        return textField
    }()
    //closure용
    private lazy var popButton: UIButton = {
        let button = UIButton()
        button.setTitle("pop", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(tapPopButton), for: .touchUpInside)
        
        return button
    }()
    
    var completionHandler: ((String) -> Void)? //MARK: 1. Closure 선언.
    //String값을 입력받고 String을 출력하는 클로저.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
}

private extension GetViewController {
    @objc func tapPopButton() {
        
//        completionHandler?(self.textField.text ?? "") //사실상 이렇게만써도 잘 작동한다. 하지만 return이 있는 클로저이기에 Result of call to function returning 'String' is unused. 이렇게 값이 사용되지않았다는 경고가 뜰수 있기때문에 형식상 _ = 를 사용해서 값 받은 척~! 하는 것 같다. 
        
        _ = completionHandler?(self.textField.text ?? "") //MARK: 2. Closure를 통해 값을 전달?
        //_; 와일드카드: 값을 해제하거나 무시하는 패턴 중 하나.
        //"이 자리에 올 것이 무엇이든 상관하지 말라"라는 뜻이다.
        //TODO: 정확한 원리 알아보기. 가장 하단 주석 참고.
        //값을 리턴하는 클로저(함수) 형태이지만 그 값을 사용하지않을 경우 _ 와일드카드를 사용하여 컴파일러에게 알려주는 것 같다. (에러방지)
        
        self.navigationController?.popViewController(animated: true)
    }

    func setupLayout() {
        [
            textField,
            popButton
        ].forEach { view.addSubview($0) }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        popButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

//MARK: - wildcard _
/*
 여러 용도가 있지만 그 중 하나의 기능내용을 가져와보았다.
 
 Skip the result of a function with a wildcard.
 If you have any function that returns a type, we can still call that function with the following:
 
 addNumbers(3, 4)
 
 However this would come packaged with a rather nice compiler error from Swift.
 Let us just tell Swift that we won't use that return value. Guess what; we will use a wildcard.
 
 _ = addNumbers(3, 4)
 */
