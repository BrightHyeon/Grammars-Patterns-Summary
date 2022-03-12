//
//  ViewController.swift
//  DelegatePatternUIKit
//
//  Created by HyeonSoo Kim on 2022/03/10.
//
//MARK: - <Navigation Stack에서의 Delegate Date 전달>


import UIKit
import SnapKit

//MARK: 1. Delegate 프로토콜 생성. Delegation은 "직접 전달 방식"에 해당.
protocol SendTextDataDelegate: AnyObject {
    func sendData(data: String)
}

class SendViewController: UIViewController {
    
    //MARK: 2. delegate 위임 변수 생성
    weak var delegate: SendTextDataDelegate?
    
    //보낼 text정보를 가진 UITextField
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.textColor = .label
        
        return textField
    }()
    
    private lazy var popButton: UIButton = {
        let button = UIButton()
        button.setTitle("delegate pop", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.green.cgColor
        
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        button.addTarget(self, action: #selector(popDelegate), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

private extension SendViewController {
    func setupLayout() {
        [
            textField,
            popButton
        ].forEach { view.addSubview($0) }
        
        let inset: Float = 15.0
        
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(inset)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
        }
        
        popButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(inset)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
    }
    
    //MARK: 3. delegate프로토콜의 위임변수 delegate의 sendData함수를 통해 보내고자하는 data를 전달.
    @objc func popDelegate() {
        if let text = textField.text {
            delegate?.sendData(data: text)
        }
        
        self.navigationController?.popViewController(animated: false)
    }
}

