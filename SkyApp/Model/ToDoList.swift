//
//  ToDoList.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import Foundation

class ItemModel: ObservableObject, Identifiable, Hashable{
    var id: UUID
    var title: String
    var content: String
    var isCompleted: Bool
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
            lhs.id == rhs.id
        }
    
    init(id: UUID = UUID(), title: String, content: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.content = content
        self.isCompleted = false
    }
    
    func checkItem() -> ItemModel {
        return ItemModel(id: id, title: title, content: content, isCompleted: !isCompleted)
    }
    
    
}



