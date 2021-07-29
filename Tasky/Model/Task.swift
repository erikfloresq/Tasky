//
//  Task.swift
//  Task
//
//  Created by Erik Flores on 28/7/21.
//

import Foundation

class Task: Identifiable {
    let id: Int
    let description: String
    let date: Date
    var status: TaskStatus
    
    init(id: Int, description: String, date: Date, status: TaskStatus) {
        self.id = id
        self.description = description
        self.date = date
        self.status = status
    }
}
