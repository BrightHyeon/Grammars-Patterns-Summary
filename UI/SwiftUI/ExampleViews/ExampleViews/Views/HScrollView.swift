//
//  HScrollView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/22.
//
//  "에브리타임" App's Horizontal ScrollView - Clone Coding
//  각 셀이 하나의 버튼으로 동작. UIKit으로 치면 didSelect메서드 구현.

import SwiftUI

struct HScrollView: View {
    
    private let cellList: [HSVsStorage] =
    [
        HSVsStorage(titleLabel: "복학 신청기간 만료일", dateLabel: dateToString(), systemImageName: "calendar", buttonLabel: "학사 일정 >", foregroundColor: .green),
        HSVsStorage(titleLabel: "복학 신청 및 허가기간 마감", dateLabel: dateToString(), systemImageName: "calendar", buttonLabel: "학사 일정 >", foregroundColor: .green),
        HSVsStorage(titleLabel: "대학생 필수 사이트 모음", dateLabel: "과제할 때 도움되는 사이트 없나요?", systemImageName: "lightbulb", buttonLabel: "자세히 >", foregroundColor: .yellow),
        HSVsStorage(titleLabel: "오늘의 할일", dateLabel: dateToString(), systemImageName: "checkmark.square", buttonLabel: "전체 보기 >", foregroundColor: .blue)
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                Spacer()
                
                ForEach(cellList, id: \.self) {
                    HScrollViewCell(cellData: $0)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct HScrollViewCell: View {
    
    let cellData: HSVsStorage
    
    var body: some View {
        Button {
            print("HScrollViewCell tapped")
        } label: {
            HStack(alignment: .top, spacing: 15) {
                Image(systemName: cellData.systemImageName)
                    .resizable()
                    .foregroundColor(cellData.foregroundColor)
                    .frame(width: 30, height: 30)
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    Text(cellData.titleLabel) //색지정안하면 .label색과 동일한 효과
                        .font(Font.title3)
                        .fontWeight(Font.Weight.bold)
                        .lineLimit(1)
                    Text(cellData.dateLabel)
                        .font(.caption)
                        .foregroundColor(cellData.foregroundColor)
                    ZStack {
                        Color.gray.opacity(0.2)
                            .frame(width: 80, height: 30)
                            .cornerRadius(15)
                            .offset(x: -10, y: 0)
                        Text(cellData.buttonLabel)
                            .font(.caption)
                            .offset(x: -10, y: 0)
                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(minWidth: 270, maxWidth: 300,
                   minHeight: 150, maxHeight: 150)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 2)
                //border기능은 view에도 있지만, 고급기능(radius등)을 부여하려면,
                //overlay활용가능.
            }
        }
    }
}

struct HScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HScrollView()
    }
}

//MARK: 현재 날짜정보를 format하는 함수구현.
private func dateToString() -> String {
    let date = Date()
    let df = DateFormatter()
    df.locale = Locale(identifier: "ko_KR")
    df.dateFormat = "MM월 dd일 (E)"
    
    return df.string(from: date)
}
