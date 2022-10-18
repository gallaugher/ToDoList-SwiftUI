//
//  ToDosViewModel.swift
//  ToDoList
//  Created by John Gallaugher on 10/9/22
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        // Don't try to update if toDos.id == nil, which it never should be. But in case another developer tries to call this in the wrong place, we're covered...
        guard toDo.id != nil else {return}
        
        // copy toDo (a constant) into a newToDo (var) so we can update the isCompleted property
        var newToDo = toDo
        newToDo.isCompleted.toggle() // flips false to true and true to false
        // Find the ID for newToDo in the array of toDos, then update the element at that index with the data in newToDo
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        saveData()
    }

    func saveToDo(toDo: ToDo) {
        // if new, append to toDoVM.todos else update the toDo that was passed in from the List
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) // try? means if error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
