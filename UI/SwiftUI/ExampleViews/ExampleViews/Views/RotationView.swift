//
//  RotationView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/28.
//
//  주요 기술 - @State프로퍼티-바인딩,
//            Slider(), TextField() + RoundedBorderTextFieldStyle()
//            .rotationEffect(), .animation()
//            Picker(), ForEach, pickerStyle, frame, clipped.

import SwiftUI

struct RotationView: View {
    
    var colors: [Color] = [.red, .blue, .yellow, .black, .green]
    var colorNames = ["Red", "Blue", "Yellow", "Black", "Green"]
    
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI!"
    @State private var colorIndex = 2
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation)) //회전이펙트
                .animation(.easeInOut(duration: 5), value: rotation)
                //animation의 easeInOut의 duration이용하여 좀더 자연스럽게 설정하기.
                .foregroundColor(self.colors[self.colorIndex])
            
            Spacer()
            
            Divider()
                .padding()
                
            Slider(value: $rotation, in: 0...360, step: 0.1)
            //rotation값을 바인딩하고, 범위정하고, 증가단위 정하기.
                .padding()
            
            //text와 바인딩. 입력된 값이 위의 Text에 가도록.
            TextField("Enter text here", text: $text)
                //이렇게 간편하게 textField에 Border를 넣을 수 있다니...(현타)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            //selection: 현재 선택, content(구성): Picker의 항목들을 정의.
            HStack {
                Text("Choose Color") //이제는 picker label이 인식이 안되는듯.
                    .fontWeight(.bold)
                Picker(selection: $colorIndex, label: Text("Color")) {
                    //Picker에는 ForEach구문으로 구성하는 듯. 일반적으로.
                    ForEach(0..<colorNames.count) { //항목개수만큼
                        Text(self.colorNames[$0])   //각 항목이름넣고,
                            .foregroundColor(self.colors[$0]) //알맞은 색 입히기.
                    }
                }
                .pickerStyle(.wheel)
                //.wheel, .inline, .automatic, .menu, .segmented 등.
                .frame(width: 220, height: 200)
                .clipped() //frame, clipped이용하여 picker사이즈 조정!
            }
            .padding()
            
        }
    }
}

struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView()
    }
}
