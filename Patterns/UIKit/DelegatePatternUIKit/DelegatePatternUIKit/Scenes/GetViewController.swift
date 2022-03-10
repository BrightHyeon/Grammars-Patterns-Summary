//
//  GetViewController.swift
//  DelegatePatternUIKit
//
//  Created by HyeonSoo Kim on 2022/03/10.
//
//MARK: - <Navigation Stack에서의 Delegate Date 전달>


import UIKit
import SnapKit

class GetViewController: UIViewController, SendTextDataDelegate { //MARK: 4. 프로토콜 채택.
    
    private lazy var pushButton: UIButton = {
        let pushButton = UIButton()
        pushButton.setTitle("Push to SendViewController", for: .normal)
        pushButton.setTitleColor(.blue, for: .normal)
        pushButton.addTarget(self, action: #selector(pushToSendView), for: .touchUpInside)
        
        return pushButton
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupLayout()
    }
    
    //MARK: 5. 프로토콜 준수위한 메서드 생성하면서 실행할 구문을 설명. 정의. (따로 호출 필요없음.)
    func sendData(data: String) {
        self.textLabel.text = data
    }
}

private extension GetViewController {
    func setupNavigationBar() {
        navigationItem.title = "Delegate Pattern"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupLayout() {
        [
            pushButton,
            textLabel
        ].forEach { view.addSubview($0) }
        
        pushButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.centerY)
            $0.leading.trailing.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(pushButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func pushToSendView() {
        let sendVC = SendViewController()
        sendVC.delegate = self //MARK: 6. delegate를 위임주는 쪽의 delegate를 self로. (내(self)가 (너의 delegate를) 위임받겠다~!)
        
        self.navigationController?.pushViewController(sendVC, animated: false)
    }
}
