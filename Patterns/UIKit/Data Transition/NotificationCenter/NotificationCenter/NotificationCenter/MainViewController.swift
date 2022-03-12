//
//  ViewController.swift
//  NotificationCenter
//
//  Created by HyeonSoo Kim on 2022/03/12.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("PushToPostVC", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textPostNotification(_:)),
            name: NSNotification.Name("textPost"),
            object: nil
        )
    }
}

private extension MainViewController {
    @objc func textPostNotification(_ notification: Notification) {
        guard let text = notification.object as? String else { return }
        self.textLabel.text = text
    }
    
    @objc func tapPushButton() {
        let postVC = PostViewController()
        
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
    func setupLayout() {
        view.addSubview(textLabel)
        view.addSubview(pushButton)
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview()
        }
        pushButton.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
