//
//  ContentView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/14.
//

import SwiftUI

struct AllContentView: View {
    @State private var showModal = false
    @State private var title: String = ""
    @State private var content: String = ""
    @StateObject private var itemStore = ItemStore()
    
    var body: some View {
        VStack{
            LazyVStack(pinnedViews: .sectionHeaders) {
                Section(header: HeaderView()){
                    VStack {
                    }
                }
            }
            ContentsView(itemStore: itemStore)
            Button( action: {
                self.showModal = true
            }) {
                Text("Add content")
            }
            .font(.system(size: 28))
            .foregroundColor(Color.blue)
            .sheet(isPresented: self.$showModal) {
                AddContentModalView(title: $title, content: $content, itemStore: itemStore)
                    .presentationDetents([.medium])
                    .cornerRadius(20)
            }
        }
//        .toolbar{
//            ToolbarItem (placement: .navigationBarLeading){
//                EditButton()
//            }
//        }
    }
}

private struct HeaderView: View {
  fileprivate var body: some View {
    HStack {
      Spacer()
      Text("ToDoList")
        .font(.title)
        .bold()
        .foregroundColor(.blue)
      Spacer()
    }
    .background(.white)
  }
}



struct AllContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AllContentView()
        }
    }
}
