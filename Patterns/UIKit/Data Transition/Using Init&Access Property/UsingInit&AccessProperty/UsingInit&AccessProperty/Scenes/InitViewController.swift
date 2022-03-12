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
    private lazy var textLabel: UILabel = { //이런 형태의 값 전달은 클로저를 이용한 것이다. 또한 lazy선언이기에 필요할 때 값이 할당된다. 단순히 빈값을 생성하고, 다른 함수에서 세세한 것을 정의한 후 그 함수를 필요 시점에 호출한 것과 같은 효과를 발휘한다. 어차피 같은 것이라면 가독성을 높일 수 있도록 그 변수의 특징은 변수 블럭안에 정의하는 것이 좋아보인다. 
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
//    } =====>>>>> 안먹힘. //TODO: 원인분석. Answer: 이런 방법이 아니라, MainVC에 값을 처리하는 함수를 만들고, 그 함수에 전달인자로 값을 넘긴 후, MainVC에서 값을 정제해야한다. 허나 이 방법은 서로 tight-Coupled한 상태(ex) Nav로 이어진 가까운 뷰컨 사이)에서 할 수 있는 방법이기 때문에 이어지는 Stack이 많을수록 스파게티처럼 늘어진다. 가독성 및 유지보수력이 떨어질 수 있으니 추천하지않는다.
}

//private extension InitViewController {
//    @objc func tapBackButton() {
//        let mainVC = MainViewController()
//        mainVC.mainLabel.text = "init에서 왔다."
//
//        self.navigationController?.popViewController(animated: true)
//    } =====>>>>> 안먹힘. //TODO: 원인분석. Answer: 위와 동일함.
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
