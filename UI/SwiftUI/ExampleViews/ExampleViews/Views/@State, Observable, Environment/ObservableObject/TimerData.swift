//
//  TimerData.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//  주요 기술 - ObservableObject, Combine
//            @Published
//            Timer.scheduledTimer(timeInterval: ,target: ,selector: ,userInfo: ,repeats: )

import Foundation
import Combine

class TimerData: ObservableObject {
    
    @Published var timeCount = 0
    
    var timer: Timer? //timer를 적당한 시기에 만들고, 그에서 비롯된 실행구문을 통해 timeCount의 값을 조정.
    
    @Published var isPaused: Bool = false
    //MARK: JDM - 이 작업하면서 깨달았다!!! 굳이 @Published안하더라도, 인스턴스 프로퍼티에 접근이 가능한데, 왜 해야할까? 했는데, 이런식으로 해야 접근하여 값이 변경될 때 SwiftUI가 바로바로 업데이트를 실행해준다~!!!. 그래서 이를 가져와 참조하는 뷰 역시 계속 업데이트가 가능해진다~!!! 왜 시간에 따라 변하는 동적데이터다루는데 좋다는지 알겠음~!!!!!
    //MARK: 생각해보면 @State도 그 뷰 struct안에서 바인딩된 값이 바뀔때마다 SwiftUI가 업데이트시켜주듯이 비슷한 동작 원리인 듯~!!!
    
    
    init() { //초기화 코드! 이 class의 인스턴스가 생성될 때 실행할 코드를 작성.
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, //타이머 실행간격(초).
                                     target: self, //selector가 호출되야하는 클래스 인스턴스. 보통은 self사용하여 현재 위치의 함수를 사용하는 경우가 일반적임.
                                     selector: #selector(timerDidFire), //시간이 흐를때, 즉 1초마다 호출되는 함수이다.
                                     userInfo: nil, //selector에게 제공되는 데이터가 있는 dictionary. 없으면 nil.
                                     repeats: true) //반복여부 - false일 시 한번 실행된 후 중지된다. 즉 여기선 1까지만 오르고 stop됨.
    }
    
    @objc func timerDidFire() {
        timeCount += 1 //실제 timer의 시간이 갈 때, published프로퍼티인 timeCount의 숫자도 오를 수 있도록!
        //뭔가 자기만의 custom한 비율로 올리고 싶다면, custom한 연산을 넣으면 될 것!
        //만약 timeInterval이 2.0으로 setting되어있다면, += 2 가 적당할 것임. TODO: 해보자. -> 맞음.
    }
    
    func resetCount() {
        timeCount = 0
    }
    
    func stopCount() {
        if isPaused {
            timer?.invalidate()
            
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
        }
    }
    
}

//timer.invalidate() 를 사용하면 타이머가 중지됩니다.
