//
//  AddContentModalView.swift
//  SkyApp
//
//  Created by 오영석 on 2023/06/15.
//

import SwiftUI

//struct EditContentModalViewPreview: View {
//    @Environment(\.presentationMode) var presentation
//    @State var title: String = ""
//    @State var content: String = ""
//    @StateObject var itemStore = ItemStore()
//    @Binding var current_title: String
//    @Binding var current_content: String
//
//    var body: some View {
//        EditContentModalView(presentation: _presentation, title: $title, content: $content, itemStore: itemStore, current_title: $current_title,current_content: $current_content)
//    }
//}

struct EditContentModalView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var title: String
    @Binding var content: String
    @State private var showingAlert = false
    @ObservedObject var itemStore: ItemStore
    @State private var isInputEnabled = false
    
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
                .disabled(!isInputEnabled)
            
            Text("Content")
                .font(.title2)
                .bold()
                .foregroundColor(Color.blue)
            
            TextField("Edit", text: $content)
                .padding(12)
                .frame(width: 300, height: 200, alignment: .center)
                .background(Color(uiColor: .secondarySystemBackground))
                .font(.system(size: 24))
                .foregroundColor(Color.black)
                .disabled(!isInputEnabled)
            HStack{
                Button (action: {
                    isInputEnabled.toggle()
//                    editButtonClicked()
                }, label: {
                    Text(isInputEnabled ? "Complete" : "Edit")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.blue)
                })
                .buttonStyle(.plain)
                .alert("Failed edit", isPresented: $showingAlert){
                    Button("Ok") {}
                } message: {
                    Text("Title or Content empty")
                }
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.blue)
                }.buttonStyle(.plain)
            }
        }
    }
    
    func editButtonClicked() {
            if title == "" || content == "" {
                showingAlert = true
            }
        else {
            itemStore.addEditItem(title: title, content: content)
            presentation.wrappedValue.dismiss()
        }
    }
    
    
}

//struct EditContentModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditContentModalViewPreview()
//    }
//}

