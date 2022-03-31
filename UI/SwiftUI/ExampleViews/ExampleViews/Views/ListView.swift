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
        NavigationView {
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
                        HStack {           //View타입은 다 올수있다.(목적지)
                            NavigationLink(destination: Text(item.task)) {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    //MARK: 편집을 위한 사전작업(수정자를 셀에 적용시키기)
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    //둘다 perform함수까지 잘 넣어줘야 활성화됨.
                } header: {
                    Text("To Do Tasks")
                }
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: EditButton())
            //MARK: onMove와 EditButton()은 한 세트. 편집 모드로 알아서 전환하게함.
        }
    }
    
    //MARK: 편집 기능
    //삭제
    func deleteItem(at offsets: IndexSet) {
        //데이터 소스에서 항목을 삭제하는 코드가 여기온다.
        //실제 데이터가 담긴 곳에서도 데이터를 삭제해야한단 것!
    }
    //이동
    func moveItem(from source: IndexSet, to destination: Int) {
        //항목을 재배열하는 코드가 온다.
    }
}


//MARK: Storage
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

/*
 <편집 기능>
 1. 삭제
 - dataSource에서 해당 항목을 삭제하는 onDelete() 수정자를 각 리스트 셀에 추가.
 - 이 메서드가 호출되면 삭제될 행의 offset을 가진 IndexSet객체가 전달됨.
 - 이 메서드를 구현했다면 사용자가 행을 스와이프할때 delete버튼이 뜨게됨.
 */
