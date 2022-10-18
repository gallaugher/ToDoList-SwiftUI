//
//  ToDoListApp.swift
//  ToDoList
//  Created by John Gallaugher on 9/30/22
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
