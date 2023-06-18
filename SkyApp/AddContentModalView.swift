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
    @State private var showingAlert = false
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
            Button {
                addButtonClicked()
            } label: {
                Text("Add")
                    .font(.title2)
                    .bold()
            }.alert("Failed add to list", isPresented: $showingAlert){
                Button("Ok") {}
            } message: {
                Text("Title or Content empty")
            }
        }
        .onDisappear {
            title = ""
            content = ""
        }
    }
    
    func addButtonClicked() {
            if title == "" || content == "" {
                showingAlert = true
            }
        else {
            itemStore.addEditItem(title: title, content: content)
            title = ""
            content = ""
            presentation.wrappedValue.dismiss()
        }
    }
    
}

struct AddContentModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddContentModalViewWrapper()
    }
}
