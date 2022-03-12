//
//  PostViewController.swift
//  NotificationCenter
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit
import SnapKit

class PostViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
}

private extension PostViewController {
    func setupLayout() {
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func tapBackButton() {
        
        NotificationCenter.default.post(
            name: NSNotification.Name("textPost"),
            object: "Notification Center를 통해 온 String데이터올시다~!",
            userInfo: nil
        )
        
        self.navigationController?.popViewController(animated: true)
    }
}
