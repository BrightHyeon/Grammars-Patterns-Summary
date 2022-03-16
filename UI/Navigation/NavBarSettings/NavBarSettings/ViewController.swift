//
//  ViewController.swift
//  NavBarSettings
//
//  Created by HyeonSoo Kim on 2022/03/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
    }

}

//각종 setup을 위한 메서드는 private하게 하는 습관.
private extension ViewController {
    func setupNavBar() {
        
        //MARK: Center title 설정
        navigationItem.title = "title"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        //MARK: Custom한 Center title 설정
        /*navigationItem.titleView = UIView() -> class를 상속하는 UIView 객체들이 올 수 있음.
        //UILabel, UIButton, UIView 등등. 이를 이용하여 title부분을 다채롭게 나타낼 수 있고, 특정 Action을 부여할 수도 있으며, font설정도 가능.*/
        //예시)
//        let barCenterButton: UIButton = {
//            let button = UIButton()
//            button.setImage(UIImage(systemName: "calendar"), for: .normal)
//            button.setTitle("title", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
//            return button
//        }()
//        self.navigationItem.titleView = barCenterButton
        
        
        //MARK: left & right BarButtonItem 설정 (title, image따위 넣을 수 있음.)
        // UIBarButtonItem(/*원하는 스타일대로 구현*/)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"),
            style: .plain,
            target: self,
            action: nil
        ) //image를 넣을수도,
        navigationItem.rightBarButtonItem = UIBarButtonItem( //TODO: BarButtonTitle UIFont설정. -> 좀 어려움. 추후 도전.
            title: "D-day",
            style: .plain,
            target: self,
            action: nil
        ) //title을 넣을수도 있음.

        //MARK: e
    }
}
