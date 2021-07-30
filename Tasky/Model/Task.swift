//
//  Task.swift
//  Task
//
//  Created by Erik Flores on 28/7/21.
//

import Foundation

class Task: Identifiable {
    let description: String
    var status: TaskStatus
    
    init(description: String, status: TaskStatus) {
        self.description = description
        self.status = status
    }
}
