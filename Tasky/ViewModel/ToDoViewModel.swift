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
    let storage: PersistenceManager
    
    init(storage: PersistenceManager) {
        self.storage = storage
        toDoTasks = fetch(status: .todo)
    }
    
    func getIdForNewElement() -> Int {
        return toDoTasks.count + 1
    }

    func fetch(status: TaskStatus) -> [TaskMO] {
        return storage.tasks.filter({ $0.taskStatus == status })
    }

    func update() {
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

