//
//  ItemM.swift
//  ToDoListMurphy
//
//  Created by Thomas Murphy on 3/20/22.
//

import Foundation

struct ItemM: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString , title: String, isCompleted: Bool){
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemM {
        return ItemM(id: id, title: title, isCompleted: !isCompleted)
    }
}


