//
//  ContentsView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import SwiftUI

class ItemStore: ObservableObject {
    @Published var items: [ItemModel] = []
    
    func addItem(title: String, content: String) {
        let newItem = ItemModel(title: title, content: content, isCompleted: false)
        items.append(newItem)
        print("hello \(title) and \(content)")
        print("hello \(items)")
    }
    
}

struct ContentsView: View {
    @ObservedObject var itemStore: ItemStore
    
    var body: some View {
        List{
            ForEach(itemStore.items, id: \.self) { item in
                ContentRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            checkedItem(item: item)
                        }
                    }
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: onMoveItem)
        }
        .listStyle(.plain)
    }
    
    func deleteItem(indexSet: IndexSet) {
        itemStore.items.remove(atOffsets: indexSet)
    }
    
    func onMoveItem(from: IndexSet, to: Int) {
        itemStore.items.move(fromOffsets: from, toOffset: to)
    }
    
    func checkedItem(item: ItemModel) {
        if let index = itemStore.items.firstIndex(where: {$0.id == item.id}) {
            itemStore.items[index] = item.checkItem()
        }
    }
    
}



struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        let itemStore = ItemStore()
        ContentsView(itemStore: itemStore)
    }
}
