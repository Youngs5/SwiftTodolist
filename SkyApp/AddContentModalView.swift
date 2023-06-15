//
//  AddContentModalView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/15.
//

import SwiftUI

struct AddContentModalViewWrapper: View {
    @Environment(\.presentationMode) var presentation
    @State var title: String = ""
    @State var content: String = ""
    @StateObject var itemStore = ItemStore()
    
    var body: some View {
        AddContentModalView(presentation: _presentation, title: $title, content: $content, itemStore: itemStore)
    }
}

struct AddContentModalView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var title: String
    @Binding var content: String
    @ObservedObject var itemStore: ItemStore
    
    var body: some View {
        VStack {
            Text("Title")
                .font(.title2)
                .bold()
                .foregroundColor(Color.blue)
            
            TextField("제목 적어주셈", text: $title)
                .padding(12)
            .frame(width: 300, height: 50, alignment: .center)
            .background(Color(uiColor: .secondarySystemBackground))
            .font(.system(size: 24))
            .foregroundColor(Color.black)
            .padding(.bottom, 12)
            
            Text("Content")
                .font(.title2)
                .bold()
                .foregroundColor(Color.blue)
            
            TextField("내용 적어주셈", text: $content)
                .padding(12)
            .frame(width: 300, height: 200, alignment: .center)
            .background(Color(uiColor: .secondarySystemBackground))
            .font(.system(size: 24))
            .foregroundColor(Color.black)
            .padding(.bottom, 16)
            Button {
                addButtonClicked()
            } label: {
                Text("Add")
                    .font(.title2)
                    .bold()
            }
        }
        .onDisappear {
            title = ""
            content = ""
        }
    }
    
    func addButtonClicked() {
        itemStore.addItem(title: title, content: content)
        title = ""
        content = ""
        presentation.wrappedValue.dismiss()
    }
    
//    func addItem(title: String, content: String){
//        let contentsView = ContentsView()
//        let newItem = ItemModel(title: title, content: content, isCompleted: false)
//        contentsView.items.append(newItem)
//    }
}

struct AddContentModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddContentModalViewWrapper()
    }
}
