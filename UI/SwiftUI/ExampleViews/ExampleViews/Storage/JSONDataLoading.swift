//
//  JSONDataLoading.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/31.
//

import UIKit
import SwiftUI

//MARK: JSON파일을 로드하는 표준 방식!!!
//"Json파일"로부터 "데이터"를 뽑고, "구조체 객체"로 변환한 다음에 "배열"에 넣기 위한 loadJson함수를 생성.

func loadJson<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
