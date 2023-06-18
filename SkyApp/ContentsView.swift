//
//  ContentsView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import SwiftUI

class ItemStore: ObservableObject {
    @Published var items: [ItemModel] = []
    
    func addEditItem(title: String, content: String) {
        let newItem = ItemModel(title: title, content: content, isCompleted: false)
        items.append(newItem)
        
    }
    
}

struct ContentsView: View {
    @StateObject var itemStore: ItemStore
    
    var body: some View {
        List{
            ForEach(itemStore.items) { item in
                ContentRowView(item: item)
            }
            .onDelete(perform: deleteItem)
//            .onMove(perform: onMoveItem)
        }
        .listStyle(.plain)
    }
    
    func deleteItem(indexSet: IndexSet) {
        itemStore.items.remove(atOffsets: indexSet)
    }
    
//    func onMoveItem(from: IndexSet, to: Int) {
//        itemStore.items.move(fromOffsets: from, toOffset: to)
//    }
    
}



struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        let itemStore = ItemStore()
        ContentsView(itemStore: itemStore)
    }
}
