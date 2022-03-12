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
        
        return label
    }()
    
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
        
        //backgroundColor를 명시하지않으면 transition될 때 투명배경느낌으로 전환되어 text가 겹치는 불상사가 발생.
        view.backgroundColor = .systemBackground
        
        setupLayout()
        
    }
}

//MARK: Private Setup Functions
private extension InitViewController {
    func setupLayout() {
        [
            textLabel
        ].forEach { view.addSubview($0) }
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
