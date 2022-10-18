//
//  ToDo.swift
//  ToDoList
//  Created by John Gallaugher on 10/9/22
//  YouTube: YouTube.com/profgallaugher, Twitter: @gallaugher

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
}
