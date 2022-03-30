//
//  AlignmentGuideView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/30.
//

import SwiftUI

struct AlignmentGuideView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) { //부모 스택이 .leading이니, 자식도 leading기준으로 움직여야함.
                    
                    Rectangle() //MARK: 기준.
                        .foregroundColor(.black)
                        .frame(width: 120, height: 50)
                    
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 120, height: 50)
                        .alignmentGuide(.leading, computeValue: {d in -20})
                        //수치로 입력할 수도 있고, (좌로 -20 = 즉, 우로 20)
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 120, height: 50)
                        .alignmentGuide(.leading) { d in
                            d.width / 2
                        } //비율로 입력할 수도 있고,
                    
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 120, height: 50)
                        .alignmentGuide(.leading) { d in
                            d[HorizontalAlignment.trailing]
                        } //해당 뷰의 어느 한 지점을 기준으로 맞출 수도 있음.
                    //기준 leading위치와 나의 trailing위치를 맞춰라~~~.
                    //현재 VStack에 속해있기에 .top, .bottom은 설정해도 아무변화 X.
                }
                
                //MARK: 표준 방법
                HStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 50, height: 120)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 50, height: 120)
                        .alignmentGuide(.top) { d in
                            d.height / 3
                        }
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 120)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 120)
                        .alignmentGuide(.top) { d in
                            60
                        }
                }
                
                //MARK: Custom 정렬 타입
                HStack(alignment: .oneThird) { //새로운 기준점을 만든것임!!!
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 50, height: 120)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 50, height: 120)
                        .alignmentGuide(.oneThird) { d in
                            d[VerticalAlignment.top]
                        }
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 120)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 120)
                        .alignmentGuide(.oneThird) { d in
                            d[VerticalAlignment.top]
                            //이 dimension의 top이 oneThird기준선과 일치하게하라!
                        }
                }
                
                //MARK: 스택정렬 교차하기.
                HStack(alignment: .crossAlignment, spacing: 20) {
                    Circle()
                        .foregroundColor(.purple)
                        .frame(width: 100, height: 100)
                        .alignmentGuide(.crossAlignment) { d in
                            d[VerticalAlignment.center]
                        }
                    
                    VStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 100, height: 100)
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 100, height: 100)
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: 100, height: 100)
                            .alignmentGuide(.crossAlignment) { d in
                                d[VerticalAlignment.center]
                            }
                        Rectangle()
                            .foregroundColor(.yellow)
                            .frame(width: 100, height: 100)
                    }
                }
                //기준점(.crossAlignment 맞추고, 나의 센터가 그 위치에 대비된다. 이느낌인가.
                //그래서 .bottom으로도 되나했는데, 표준 정렬은 인식이 안되나보다. 
            }
        }
    }
}

struct AlignmentGuideView_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuideView()
    }
}

//MARK: - Custom한 정렬타입 생성.
extension VerticalAlignment {
    
    private enum OneThird: AlignmentID {
        
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    
    static let oneThird = VerticalAlignment(OneThird.self)
    
    private enum CrossAlignment: AlignmentID {
        
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}
