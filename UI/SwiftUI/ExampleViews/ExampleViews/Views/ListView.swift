//
//  ListView.swift
//  ExampleViews
//
//  Created by HyeonSoo Kim on 2022/03/30.
//

import SwiftUI

struct ListView: View { //MARK: SwiftUI 도서 250page부근 참고.
    
    var listData: [ToDoItem] = [
        ToDoItem(task: "공부해라", imageName: "star"),
        ToDoItem(task: "사랑해라", imageName: "heart"),
        ToDoItem(task: "달력봐라", imageName: "calendar")
    ]
    
    @State private var toggleStatus: Bool = true
    
    var body: some View {
        List {
            
            Section {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notifications")
                }
            } header: {
                Text("Settings")
            }
            
            Section {
                ForEach(listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            } header: {
                Text("To Do Tasks")
            }
        }
    }
}

struct ToDoItem: Identifiable { //동적 List구현 시 표시될 데이터는 Identifiable 프로토콜을 준수해야함.
    var id = UUID() //Identifiable프로토콜 준수하기위한 필수 프로퍼티 id. 인스턴스생성시 알아서 그 놈의 UUID값이 할당될 것임? 아마두!
    var task: String
    var imageName: String
}
//id프로퍼티에는 Hashable프로토콜을 따르는 모든 타입이 다 들어갈 수 있다. (String, Int, UUID 타입 등등)

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
