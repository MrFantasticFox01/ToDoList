//
//  ListRowView.swift
//  ToDoListMurphy
//
//  Created by Thomas Murphy on 3/20/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemM
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var obj1 = ItemM(title: "first", isCompleted: false)
    static var obj2 = ItemM(title: "second", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: obj1)
            ListRowView(item: obj2)
        }
        .previewLayout(.sizeThatFits)
    }
}
