//
//  ToDoViewModel.swift
//  ToDoViewModel
//
//  Created by Erik Flores on 28/7/21.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    @Published var doingTasks: [Task] = []
    @Published var toDoTasks: [Task] = []
    
    func getIdForNewElement() -> Int {
        return toDoTasks.count + 1
    }
}

// MARK: - ToDo

extension ToDoViewModel {
    func addToDoTask(description: String) {
        let newTask = Task(id: getIdForNewElement(), description: description, date: Date.now, status: .todo)
        toDoTasks.append(newTask)
    }
    
    func removeToDoTask(_ task: Task) {
        guard let index = toDoTasks.firstIndex(where: { $0 === task }) else {
            return
        }
        toDoTasks.remove(at: index)
    }
}

// MARK: - Doing

extension ToDoViewModel {
    func addDoingTask(_ task: Task) {
        doingTasks.append(task)
        removeToDoTask(task)
    }
}
