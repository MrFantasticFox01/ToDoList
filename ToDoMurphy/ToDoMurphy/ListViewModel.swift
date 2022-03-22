//
//  ListViewModel.swift
//  ToDoListMurphy
//
//  Created by Thomas Murphy on 3/20/22.
//

/*
 basic edit Functions
 
 */

import Foundation
import UIKit
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ItemM] = [] {
        didSet{
            saveI()
        }
        
    }
    let itemK: String = "item_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
      
        guard
            let data = UserDefaults.standard.data(forKey: itemK),
            let saveI = try? JSONDecoder().decode([ItemM].self, from: data)
        else { return }
        
        self.items = saveI
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemM(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemM){
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveI() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemK)
        }
    }
}
