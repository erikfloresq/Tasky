//
//  DoingViewModel.swift
//  DoingViewModel
//
//  Created by Erik Flores on 1/8/21.
//

import Foundation

class DoingViewModel: ObservableObject {
    @Published var doingTasks: [TaskMO] = []
    let storage: PersistenceManager

    init(storage: PersistenceManager) {
        self.storage = storage
        doingTasks = fetch(status: .doing)
    }

    func fetch(status: TaskStatus) -> [TaskMO] {
        return storage.tasks.filter({ $0.taskStatus == status })
    }

    func update() {
        doingTasks = fetch(status: .doing)
        storage.save()
    }

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
