//
//  ToDoListView.swift
//  ToDoList
//  Created by John Gallaugher on 9/30/22
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
