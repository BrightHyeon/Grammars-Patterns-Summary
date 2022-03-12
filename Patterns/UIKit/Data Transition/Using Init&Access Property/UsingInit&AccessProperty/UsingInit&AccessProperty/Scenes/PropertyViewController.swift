//
//  PropertyViewController.swift
//  UsingInit&AccessProperty
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class PropertyViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PropertyVC viewDidLoad")
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    
    }
}

//MARK: Private Setup Functions
private extension PropertyViewController {
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
