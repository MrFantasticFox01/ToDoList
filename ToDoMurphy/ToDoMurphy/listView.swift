//
//  listView.swift
//  ToDoListMurphy
//
//  Created by Thomas Murphy on 3/19/22.
//

import SwiftUI

struct listView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items){item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
                
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To do List 🧭")
        .navigationBarItems( leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
                 
    }
   


struct listView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        listView()
    }
        .environmentObject(ListViewModel())
}
}

}
