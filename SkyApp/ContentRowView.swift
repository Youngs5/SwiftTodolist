//
//  ContentRowView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import SwiftUI

struct ContentRowView: View {
    @State private var showModal = false
    @State private var nTitle: String = ""
    @State private var cContent: String = ""
    @StateObject private var itemStore = ItemStore()
    @State var item: ItemModel
    var body: some View {
        HStack {
            Button( action: { item.isCompleted = !item.isCompleted},
                    label: {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .black)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
                    )
            }).buttonStyle(.plain)
            VStack{
                Text(item.title)
                    .bold()
                    .font(.title2)
                Text(item.content)
                    .font(.title3)
                    .lineLimit(3)
            }
        }
        .onTapGesture {
            self.showModal = true
            nTitle = item.title
            cContent = item.content
        }.sheet(isPresented: self.$showModal) {
            EditContentModalView(title: $nTitle, content: $cContent,            onEdit: {
                item.title = nTitle
                item.content = cContent
            })
            .presentationDetents([.medium])
            .cornerRadius(20)
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ContentRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "happydfffffffff", content: "sdddf", isCompleted: false)
    
    
    static var previews: some View {
        Group{
            ContentRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
