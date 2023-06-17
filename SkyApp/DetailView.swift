//
//  DetailView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/16.
//

import SwiftUI


struct DetailView: View {
    @State var item: ItemModel
    var body: some View {
        VStack{
            HStack{
                Text(item.title)
                    .font(.largeTitle)
                    .bold()
            }
            HStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 200, height: 200)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "happy", content: "sdddf", isCompleted: false)
    static var previews: some View {
        DetailView(item: item1)
    }
}
