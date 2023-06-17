//
//  ContentRowView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import SwiftUI

struct ContentRowView: View {
    @State var item: ItemModel
    var body: some View {
        HStack {
            Button( action: { item.isCompleted = !item.isCompleted},
        label: {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
                )
        })
            VStack{
                Text(item.title)
                    .bold()
                    .font(.title2)
                Text(item.content)
                    .font(.title3)
                    .lineLimit(1)
            }
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ContentRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "happy", content: "sdddf", isCompleted: false)
    
    
    static var previews: some View {
        Group{
            ContentRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
