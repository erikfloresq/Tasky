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
    func addNewToDoTask(description: String) {
        let newTask = Task(id: getIdForNewElement(), description: description, date: Date.now, status: .todo)
        toDoTasks.append(newTask)
    }
    
    func addOldToDoTask(_ task: Task) {
        toDoTasks.append(task)
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
        let newDoingTask = task
        newDoingTask.status = .doing
        doingTasks.append(newDoingTask)
        removeToDoTask(task)
    }
    
    func removeDoingTask(_ task: Task) {
        guard let index = doingTasks.firstIndex(where: { $0 === task }) else {
            return
        }
        doingTasks.remove(at: index)
    }
    
    func stopDoingTask(_ task: Task) {
        let oldTask = task
        oldTask.status = .todo
        removeDoingTask(oldTask)
        addOldToDoTask(oldTask)
    }
}
