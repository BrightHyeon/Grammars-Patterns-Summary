//
//  InitViewController.swift
//  UsingInit&AccessProperty
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class InitViewController: UIViewController {
    
    //MARK: Properties
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
//    private lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("back", for: .normal)
//        button.setTitleColor(.label, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
//
//        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
//
//        return button
//    }()
    
    //MARK: init
    init(labelText: String) {
        super.init(nibName: nil, bundle: nil)
        self.textLabel.text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: AppLifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("InitVC viewDidLoad")
        
        //backgroundColor를 명시하지않으면 transition될 때 투명배경느낌으로 전환되어 text가 겹치는 불상사가 발생.
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        let mainVC = MainViewController()
//        mainVC.mainLabel.text = "init에서 왔다."
//    } =====>>>>> 안먹힘. //TODO: 원인분석.
}

//private extension InitViewController {
//    @objc func tapBackButton() {
//        let mainVC = MainViewController()
//        mainVC.mainLabel.text = "init에서 왔다."
//
//        self.navigationController?.popViewController(animated: true)
//    } =====>>>>> 안먹힘. //TODO: 원인분석.
//}

//MARK: Private Setup Functions
private extension InitViewController {
    func setupLayout() {
        [
            textLabel
//            backButton
        ].forEach { view.addSubview($0) }
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview()
        }
        
//        backButton.snp.makeConstraints {
//            $0.top.equalTo(textLabel.snp.bottom).offset(150)
//            $0.leading.trailing.equalToSuperview()
//        }
    }
}
