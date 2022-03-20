//
//  ToDoMurphyApp.swift
//  ToDoMurphy
//
//  Created by Thomas Murphy on 3/20/22.

/* Big help from this fine gentleman
 Sarner, Nick "App Icon & Launch Screen." Youtube uploaded by Swiftful Thinking, March 20, 2021*/
//


import SwiftUI

@main
struct ToDoListMurphyApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
            listView()
        }
            .environmentObject(listViewModel)
    }
}
}
