//
//  ToDoViewModel.swift
//  ToDoViewModel
//
//  Created by Erik Flores on 28/7/21.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    @Published var doingTasks: [TaskMO] = []
    @Published var toDoTasks: [TaskMO] = []
    let storage: PersistenceManager
    
    init(storage: PersistenceManager) {
        self.storage = storage
        doingTasks = fetch(status: .doing)
        toDoTasks = fetch(status: .todo)
    }
    
    func getIdForNewElement() -> Int {
        return toDoTasks.count + 1
    }
}

// MARK: - ToDo

extension ToDoViewModel {
    
    func fetch(status: TaskStatus) -> [TaskMO] {
        return storage.tasks.filter({ $0.taskStatus == status })
    }
    
    func addNewToDoTask(description: String) {
        guard !description.isEmpty else {
            return
        }
        storage.addTask(description: description, status: .todo)
        toDoTasks = storage.tasks
    }
    
    func addOldToDoTask(_ task: TaskMO) {
        
    }
    
    func removeToDoTask(_ task: TaskMO) {
    }
}

// MARK: - Doing

extension ToDoViewModel {
    func addDoingTask(_ task: TaskMO) {
        task.taskStatus = .doing
        doingTasks = fetch(status: .doing)
    }
    
    func removeDoingTask(_ task: TaskMO) {
    }
    
    func stopDoingTask(_ task: TaskMO) {
    }
}
