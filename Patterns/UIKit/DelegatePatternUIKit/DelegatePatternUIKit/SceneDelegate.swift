//
//  SceneDelegate.swift
//  DelegatePatternUIKit
//
//  Created by HyeonSoo Kim on 2022/03/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        //MARK: - 선택사항
//        window?.tintColor = .label                          //* tintColor프로퍼티를 가지는 UIView객체들의 기본 tint색 설정가능
        //MARK: - Codebase로 App을 만들때, 필수 Window설정 3박자.
        window?.backgroundColor = .systemBackground                             //1. 배경색
        window?.rootViewController = UINavigationController(rootViewController: GetViewController())    //2. 루트뷰 지정
        window?.makeKeyAndVisible()                                             //3. 실제로 보이도록 나타나도록 설정(마무리 멘트)
    }
}

