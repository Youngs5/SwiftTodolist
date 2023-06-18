//
//  ToDoList.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import Foundation

struct ItemModel: Identifiable{
    var id: UUID = UUID()
    var title: String
    var content: String
    var isCompleted: Bool
    
}



