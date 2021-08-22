//
//  ToDoViewModel.swift
//  ToDoViewModel
//
//  Created by Erik Flores on 28/7/21.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDoTasks: [TaskMO] = []
    @Published var doingTasks: [TaskMO] = []
    let storage: PersistenceManager
    
    init(storage: PersistenceManager) {
        self.storage = storage
        toDoTasks = fetch(status: .todo)
        doingTasks = fetch(status: .doing)
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
    
    func update() {
        doingTasks = fetch(status: .doing)
        toDoTasks = fetch(status: .todo)
        storage.save()
    }
    
    func addNewToDoTask(description: String) {
        guard !description.isEmpty else {
            return
        }
        storage.addTask(description: description, status: .todo)
        update()
    }
    
    func removeToDoTask(_ task: TaskMO) {
        storage.remove(task)
        update()
    }
}

// MARK: - Doing

extension ToDoViewModel {
    func addDoingTask(_ task: TaskMO) {
        task.taskStatus = .doing
        update()
    }
    
    func removeDoingTask(_ task: TaskMO) {
        task.taskStatus = .done
        update()
    }
    
    func stopDoingTask(_ task: TaskMO) {
        task.taskStatus = .todo
        update()
    }
}
