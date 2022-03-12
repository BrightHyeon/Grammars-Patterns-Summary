//
//  MainViewController.swift
//  UsingInit&AccessProperty
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //MARK: Properties
    private lazy var initButton: UIButton = {
        let button = UIButton()
        button.setTitle("Using init", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        button.addTarget(self, action: #selector(tapInitButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var propertyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Access Property", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        button.addTarget(self, action: #selector(tapPropertyButton), for: .touchUpInside)
        
        return button
    }()
    
//    var mainLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 15, weight: .bold)
//        label.textColor = .label
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.text = "값"
//
//        return label
//    }() {
//        didSet {
//            print("Value changed!")
//        }
//    }
    
    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting NavBar
        setupNavigationBar()
        
        //Setting Button Layout
        setupLayout()
    }
}

//MARK: @objc Functions
private extension MainViewController {
    @objc func tapInitButton() {
        let vc = InitViewController(labelText: "MainViewController -init-> InitViewController")
        
        //TODO: Nav가 아닐땐 back버튼이 어떻게 생성되는지 보자.
        /*
         Nav이 아니라면? => 1) NavBar가 생성이 안됨.
                         2) push가 실행이 안됨.
                         3) Nav일때는 show가 push처럼 표현되고, Nav가 아닐때는 show가 present처럼 표현됨.
                         4) present는 그대로 표현됨.
                         5) 즉, 화면전환에는 문제가 없음.
         */
        
        self.navigationController?.pushViewController(vc, animated: true)
//        self.show(vc, sender: nil) //push와 유사함.
//        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func tapPropertyButton() {
        let vc = PropertyViewController()
        
        vc.textLabel.text = "MainViewController -Access-> PropertyViewController"

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Private Setup Functions
private extension MainViewController {
    func setupNavigationBar() {
        self.navigationItem.title = "Transition in NavC"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupLayout() {
        [
            initButton,
            propertyButton
//            mainLabel
        ].forEach { view.addSubview($0) }
        
        initButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview()
        }
        propertyButton.snp.makeConstraints {
            $0.top.equalTo(initButton.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview()
        }
//        mainLabel.snp.makeConstraints {
//            $0.top.equalTo(propertyButton.snp.bottom).offset(150)
//            $0.leading.trailing.equalToSuperview()
//        }
    }
}
