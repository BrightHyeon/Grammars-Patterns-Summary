//
//  ViewController.swift
//  DelegatePatternUIKit
//
//  Created by HyeonSoo Kim on 2022/03/10.
//

import UIKit
import SnapKit

class SendViewController: UIViewController {
    
    //MARK: - textLabel의 text를 Delegate pattern으로 전달해보기.
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.text = "Swiftist_BrightHyeon"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

private extension SendViewController {
    func setupLayout() {
        view.addSubview(textLabel)
        
        let inset: Float = 15.0
        
        textLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(inset)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
        }
    }
}

